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
}
