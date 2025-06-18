import 'package:equatable/equatable.dart';

class FilterParams extends Equatable {
  final bool? isCloseToWater;
  final bool? isCampFireAllowed;
  final double? minPricePerNight;
  final double? maxPricePerNight;
  final String? address;
  final List<String>? hostLanguages;

  const FilterParams({
    this.isCloseToWater,
    this.isCampFireAllowed,
    this.minPricePerNight,
    this.maxPricePerNight,
    this.address,
    this.hostLanguages,
  });

  @override
  List<Object?> get props =>
      [isCloseToWater, address, isCampFireAllowed, minPricePerNight, maxPricePerNight, hostLanguages];

  FilterParams copyWith({
    double? minPricePerNight,
    double? maxPricePerNight,
    bool? isCloseToWater,
    bool? isCampFireAllowed,
    String? address,
    List<String>? hostLanguages,
  }) {
    return FilterParams(
      minPricePerNight: minPricePerNight ?? this.minPricePerNight,
      maxPricePerNight: maxPricePerNight ?? this.maxPricePerNight,
      isCloseToWater: isCloseToWater ?? this.isCloseToWater,
      isCampFireAllowed: isCampFireAllowed ?? this.isCampFireAllowed,
      address: address ?? this.address,
      hostLanguages: hostLanguages ?? this.hostLanguages,
    );
  }
}

