import 'package:dio/dio.dart';
import '../models/campsite_model.dart';
import 'campsite_remote_data_source.dart';

class CampsiteRemoteDataSourceImpl implements CampsiteRemoteDataSource {
  final Dio dio;

  CampsiteRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<CampsiteModel>> fetchCampsites() async {
    final response = await dio.get('https://62ed0389a785760e67622eb2.mockapi.io/spots/v1/campsites');
    final List<dynamic> data = response.data;
    return data.map((json) => CampsiteModel.fromJson(json)).toList();
  }
}
