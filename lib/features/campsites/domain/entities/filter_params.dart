import 'package:equatable/equatable.dart';
import 'package:roadsurferdemo/features/campsites/domain/enums/campsite_sortby_enums.dart';

class FilterParams extends Equatable {
  final bool? isCloseToWater;
  final bool? isCampFireAllowed;
  final double? minPricePerNight;
  final double? lowestMinPricePerNight;
  final double? maxPricePerNight;
  final double? highestPricePerNight;
  final String? address;
  final List<String>? hostLanguages;
  final CampsiteSortBy? sortBy;

  const FilterParams({
    this.isCloseToWater,
    this.isCampFireAllowed,
    this.minPricePerNight,
    this.lowestMinPricePerNight,
    this.maxPricePerNight,
    this.highestPricePerNight,
    this.address,
    this.hostLanguages,
    this.sortBy,
  });

  @override
  List<Object?> get props => [
        isCloseToWater,
        address,
        isCampFireAllowed,
        minPricePerNight,
        maxPricePerNight,
        hostLanguages,
        highestPricePerNight,
        lowestMinPricePerNight,
        sortBy
      ];

  FilterParams copyWith({
    double? minPricePerNight,
    double? maxPricePerNight,
    double? lowestMinPricePerNight,
    double? highestPricePerNight,
    bool? isCloseToWater,
    bool? isCampFireAllowed,
    String? address,
    List<String>? hostLanguages,
    CampsiteSortBy? sortBy,
  }) {
    return FilterParams(
      minPricePerNight: minPricePerNight ?? this.minPricePerNight,
      maxPricePerNight: maxPricePerNight ?? this.maxPricePerNight,
      lowestMinPricePerNight: lowestMinPricePerNight ?? this.lowestMinPricePerNight,
      highestPricePerNight: highestPricePerNight ?? this.highestPricePerNight,
      isCloseToWater: isCloseToWater ?? this.isCloseToWater,
      isCampFireAllowed: isCampFireAllowed ?? this.isCampFireAllowed,
      address: address ?? this.address,
      hostLanguages: hostLanguages ?? this.hostLanguages,
      sortBy: sortBy ?? this.sortBy,
    );
  }
}
