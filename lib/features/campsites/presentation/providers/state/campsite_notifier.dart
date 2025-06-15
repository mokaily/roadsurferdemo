import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/campsite_params.dart';
import '../../../domain/entities/filter_params.dart';
import '../../../domain/use_cases/get_all_campsites_use_case.dart';
import 'campsite_state.dart';

class CampsiteNotifier extends StateNotifier<CampsiteState> {
  final GetAllCampsitesUseCase getAllCampsitesUseCase;

  List<CampsiteParams>? campsites;
  CampsiteNotifier({
    required this.getAllCampsitesUseCase,
  }) : super(const CampsiteState.initial());

  Future<void> loadCampsites({bool initLoading = false}) async {
    state = const CampsiteState.loading();

    try {
      final result = await getAllCampsitesUseCase();
      campsites = result;
      state = CampsiteState.success(campsites: result);
    } catch (e) {
      state = CampsiteState.error(e.toString());
    }
  }


  void applyFilter(FilterParams params) {
    final filtered = campsites?.where((camp) {
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
      if (params.cityName != null) {
        matches &= (camp.cityName ?? '').toLowerCase().contains(params.cityName!.toLowerCase());
      }
      if (params.hostLanguages != null && params.hostLanguages!.isNotEmpty) {
        matches &= params.hostLanguages!.any((lang) => camp.hostLanguages.contains(lang));
      }

      return matches;
    }).toList();

    state = CampsiteState.success(campsites: filtered);
  }
}
