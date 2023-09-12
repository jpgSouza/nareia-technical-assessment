import '../../../../infra/infra.dart';
import '../../../data_layer.dart';

class DailyDataSource {
  final IHttpClient _httpClient;

  DailyDataSource({
    required IHttpClient httpClient,
  }) : _httpClient = httpClient;

  Future<List<IdeasDTO>> getIdeas() async {
    final request = await _httpClient.get(Endpoints.ideas);

    return (request.data as List)
        .map((json) => IdeasDTO.fromJson(json))
        .toList();
  }
}
