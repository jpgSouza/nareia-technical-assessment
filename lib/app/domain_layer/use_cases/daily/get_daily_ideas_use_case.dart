import 'package:either_dart/either.dart';

import '../../domain_layer.dart';

class GetDailyIdeasUseCase {
  final DailyRepositoryInterface _repository;

  GetDailyIdeasUseCase({
    required DailyRepositoryInterface repository,
  }) : _repository = repository;

  Future<Either<String, List<IdeasEntity>>> call() {
    return _repository.getDailyIdeas();
  }
}
