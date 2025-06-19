import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/geocoding_params.dart';

part 'geocoding_model.g.dart';

@JsonSerializable()
class GeoCodingModel extends GeoCodingParams {
  const GeoCodingModel({
    required super.country,
    required super.city,
  });

  factory GeoCodingModel.fromJson(Map<String, dynamic> json) => _$GeoCodingModelFromJson(json);

  Map<String, dynamic> toJson() => _$GeoCodingModelToJson(this);
}
