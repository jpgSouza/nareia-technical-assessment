import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';

import '../../../../infra/infra.dart';
import '../../../data_layer.dart';

class DailyDataSource {
  final IHttpClient _httpClient;

  DailyDataSource({
    required IHttpClient httpClient,
  }) : _httpClient = httpClient;

  Future<Either<String, List<IdeasDTO>>> getIdeas() async {
    try {
      final response = await _httpClient.get(Endpoints.ideas);

      return Right(
        (response.data as List).map((json) => IdeasDTO.fromJson(json)).toList(),
      );
    } on DioException catch (e) {
      return Left(e.message ?? '');
    } on TypeError catch (e) {
      return Left(e.toString());
    }
  }
}
