import '../../../domain_layer/domain_layer.dart';
import '../../data_layer.dart';

class DailyRepository implements DailyRepositoryInterface {
  final DailyDataSource _dataSource;

  DailyRepository({
    required DailyDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<List<IdeasEntity>> getDailyIdeas() {
    return _dataSource.getIdeas();
  }
}
