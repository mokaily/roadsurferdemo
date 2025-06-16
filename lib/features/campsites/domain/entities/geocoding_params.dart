import 'package:equatable/equatable.dart';

class GeoCodingParams extends Equatable {
  final String city;
  final String country;

  const GeoCodingParams({
    required this.country,
    required this.city,
  });

  @override
  List<Object?> get props => [country, city];
}
