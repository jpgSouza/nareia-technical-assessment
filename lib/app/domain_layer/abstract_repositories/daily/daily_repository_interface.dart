import '../../domain_layer.dart';

abstract class DailyRepositoryInterface {
  Future<List<IdeasEntity>> getDailyIdeas();
}
