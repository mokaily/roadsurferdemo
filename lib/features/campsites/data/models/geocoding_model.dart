import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/geocoding_params.dart';

part 'geocoding_model.g.dart';

@JsonSerializable()
class GeoCodingModel extends GeoCodingParams {
  GeoCodingModel({
    required String country,
    required String city,
  }) : super(country: country, city: city);

  factory GeoCodingModel.fromJson(Map<String, dynamic> json) => _$GeoCodingModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeoCodingModelToJson(this);
}
