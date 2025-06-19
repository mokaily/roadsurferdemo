import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadsurferdemo/core/utils/helpers.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/campsite_params.dart';
import 'package:roadsurferdemo/features/campsites/domain/entities/filter_params.dart';
import 'package:roadsurferdemo/features/campsites/domain/enums/campsite_sortby_enums.dart';
import 'package:roadsurferdemo/features/campsites/domain/use_cases/get_all_campsites_use_case.dart';
import 'package:roadsurferdemo/features/campsites/domain/use_cases/get_geocoding_use_case.dart';

import 'campsite_state.dart';

class CampsiteNotifier extends StateNotifier<CampsiteState> {
  final GetAllCampsitesUseCase getAllCampsitesUseCase;
  final GetGeocodingCase getGeocodingCase;

  List<CampsiteParams> campsites = [];
  List<CampsiteParams> filteredCampsites = [];
  TextEditingController searchController = TextEditingController();

  FilterParams filterParams = const FilterParams();

  CampsiteNotifier({required this.getAllCampsitesUseCase, required this.getGeocodingCase})
    : super(const CampsiteState.initial());

  Future<void> loadCampsites({bool initLoading = false}) async {
    state = const CampsiteState.loading();
    try {
      final result = await getAllCampsitesUseCase();
      await _getAvailableLanguages(campsites: result);
      await _calculateMinMaxPrices(campsites: result);
      await _validateAndFixCoordinates(campsites: result);

      campsites = result;
      state = CampsiteState.success(campsites: result);
    } catch (e) {
      state = CampsiteState.error(e.toString());
    }
  }

  Future<void> getCampAddress({required double? lat, required double? long}) async {
    state = const CampsiteState.loadingAddress();
    try {
      final result = await getGeocodingCase(lat: lat, long: long);
      state = CampsiteState.addressResult(address: result);
    } catch (e) {
      state = CampsiteState.error(e.toString());
    }
  }

  _getAvailableLanguages({required List<CampsiteParams> campsites}) async {
    List<String> allLanguages = [];
    campsites
        .map(
          (e) => e.hostLanguages.forEach((lang) {
            if (!allLanguages.contains(lang)) {
              allLanguages.add(lang);
            }
          }),
        )
        .toList();
    filterParams = filterParams.copyWith(availableLanguages: allLanguages);
    state = CampsiteState.filterInitiating(filterParams: filterParams);
  }

  _validateAndFixCoordinates({required List<CampsiteParams> campsites}) async {
    for (int i = 0; i < campsites.length; i++) {
      final camp = campsites[i];
      if (!Helpers.validateLatLong(lat: camp.latitude, long: camp.longitude)) {
        campsites[i] = camp.copyWith(latitude: camp.longitude, longitude: camp.latitude);
      }
    }
  }

  _calculateMinMaxPrices({required List<CampsiteParams> campsites}) async {
    final lowestPrice = campsites.map((e) => e.pricePerNight).reduce((a, b) => a < b ? a : b);
    final highestPrice = campsites.map((e) => e.pricePerNight).reduce((a, b) => a > b ? a : b);

    filterParams = filterParams.copyWith(
      lowestMinPricePerNight: lowestPrice,
      highestPricePerNight: highestPrice,
    );
    state = CampsiteState.filterInitiating(filterParams: filterParams);
  }

  void searchCampsites(String query) async {
    state = const CampsiteState.searchLoading();
    if (query.isEmpty) {
      state = CampsiteState.searchResult(campsites: campsites);
    } else {
      final filtered = (filteredCampsites.isEmpty ? campsites : filteredCampsites)
          .where(
            (camp) => (camp.label.toLowerCase() + camp.address.toLowerCase()).contains(query.toLowerCase()),
          )
          .toList();
      filteredCampsites = filtered;
      state = CampsiteState.searchResult(campsites: filtered);
    }
  }

  void applyFilter(FilterParams params) {
    state = const CampsiteState.filterLoading();
    filterParams = params;
    final filtered =
        (filteredCampsites.isEmpty || searchController.text.isEmpty ? campsites : filteredCampsites).where((
          camp,
        ) {
          bool matches = true;

          if (params.isCloseToWater != null) {
            matches &= camp.isCloseToWater == params.isCloseToWater;
          }
          if (params.isCampFireAllowed != null) {
            matches &= camp.isCampFireAllowed == params.isCampFireAllowed;
          }
          if (params.minPricePerNight != null) {
            matches &= camp.pricePerNight >= params.minPricePerNight!;
          }
          if (params.maxPricePerNight != null) {
            matches &= camp.pricePerNight <= params.maxPricePerNight!;
          }
          if (params.address != null) {
            matches &= (camp.address).toLowerCase().contains(params.address!.toLowerCase());
          }
          if (params.hostLanguages != null && params.hostLanguages!.isNotEmpty) {
            matches &= params.hostLanguages!.any((lang) => camp.hostLanguages.contains(lang));
          }
          return matches;
        }).toList();

    switch (params.sortBy) {
      case CampsiteSortBy.lowestPrice:
        filtered.sort((a, b) => a.pricePerNight.compareTo(b.pricePerNight));
        break;
      case CampsiteSortBy.highestPrice:
        filtered.sort((a, b) => b.pricePerNight.compareTo(a.pricePerNight));
        break;
      case CampsiteSortBy.older:
        filtered.sort((a, b) => a.createdAt.compareTo(b.createdAt));
        break;
      case CampsiteSortBy.newer:
        filtered.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
      default:
        break;
    }
    filteredCampsites = filtered;
    state = CampsiteState.filterResult(campsites: filtered);
  }

  void resetFilters() {
    filterParams = FilterParams(
      highestPricePerNight: filterParams.highestPricePerNight,
      lowestMinPricePerNight: filterParams.lowestMinPricePerNight,
      availableLanguages: filterParams.availableLanguages,
    );
    searchController.clear();
    state = CampsiteState.filterInitiating(filterParams: filterParams);
    state = CampsiteState.filterResult(campsites: campsites);
  }
}
