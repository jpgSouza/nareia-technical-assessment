import 'package:either_dart/either.dart';

import '../../domain_layer.dart';

abstract class DailyRepositoryInterface {
  Future<Either<String, List<IdeasEntity>>> getDailyIdeas();
}
