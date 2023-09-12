import 'package:flutter_modular/flutter_modular.dart';

import '../../../data_layer/data_layer.dart';
import '../../../domain_layer/domain_layer.dart';
import 'cubit/daily_cubit.dart';
import 'daily_page.dart';

class DailyModule extends Module {
  @override
  void binds(Injector i) {
    i
      ..addLazySingleton(DailyDataSource.new)
      ..addLazySingleton<DailyRepositoryInterface>(DailyRepository.new)
      ..addLazySingleton(GetDailyIdeasUseCase.new)
      ..addLazySingleton(DailyCubit.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Modular.initialRoute,
      child: (_) => DailyPage(
        scrollController: r.args.data,
      ),
    );
  }
}
