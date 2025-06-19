import 'package:equatable/equatable.dart';
import 'package:roadsurferdemo/features/campsites/domain/enums/campsite_sortby_enums.dart';

class FilterParams extends Equatable {
  final bool? isCloseToWater;
  final bool? isCampFireAllowed;
  final double? minPricePerNight;
  final double? maxPricePerNight;
  final double? lowestMinPricePerNight;
  final double? highestPricePerNight;
  final String? address;
  final List<String>? hostLanguages;
  final List<String>? availableLanguages;
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
    this.availableLanguages,
    this.sortBy,
  });

  @override
  List<Object?> get props => [
    isCloseToWater,
    isCampFireAllowed,
    minPricePerNight,
    maxPricePerNight,
    lowestMinPricePerNight,
    highestPricePerNight,
    address,
    hostLanguages,
    availableLanguages,
    sortBy,
  ];

  FilterParams copyWith({
    Object? isCloseToWater = _sentinel,
    Object? isCampFireAllowed = _sentinel,
    Object? minPricePerNight = _sentinel,
    Object? maxPricePerNight = _sentinel,
    Object? lowestMinPricePerNight = _sentinel,
    Object? highestPricePerNight = _sentinel,
    Object? address = _sentinel,
    Object? hostLanguages = _sentinel,
    Object? availableLanguages = _sentinel,
    Object? sortBy = _sentinel,
  }) {
    return FilterParams(
      isCloseToWater: isCloseToWater != _sentinel ? isCloseToWater as bool? : this.isCloseToWater,
      isCampFireAllowed: isCampFireAllowed != _sentinel ? isCampFireAllowed as bool? : this.isCampFireAllowed,
      minPricePerNight: minPricePerNight != _sentinel ? minPricePerNight as double? : this.minPricePerNight,
      maxPricePerNight: maxPricePerNight != _sentinel ? maxPricePerNight as double? : this.maxPricePerNight,
      lowestMinPricePerNight: lowestMinPricePerNight != _sentinel
          ? lowestMinPricePerNight as double?
          : this.lowestMinPricePerNight,
      highestPricePerNight: highestPricePerNight != _sentinel
          ? highestPricePerNight as double?
          : this.highestPricePerNight,
      address: address != _sentinel ? address as String? : this.address,
      hostLanguages: hostLanguages != _sentinel ? hostLanguages as List<String>? : this.hostLanguages,
      availableLanguages: availableLanguages != _sentinel
          ? availableLanguages as List<String>?
          : this.availableLanguages,
      sortBy: sortBy != _sentinel ? sortBy as CampsiteSortBy? : this.sortBy,
    );
  }

  static const _sentinel = Object();
}
