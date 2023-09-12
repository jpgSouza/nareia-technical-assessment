import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'infra/infra.dart';
import 'presentation_layer/modules/daily/daily_module.dart';
import 'presentation_layer/modules/ideas/ideas_module.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i
      ..addLazySingleton(() => Dio())
      ..addLazySingleton<IHttpClient>(HttpClient.new);
    IdeasModule().binds(i);
  }

  @override
  void routes(RouteManager r) {
    r
      ..module(Modular.initialRoute, module: IdeasModule())
      //TODO: Add to const
      ..module('/daily', module: DailyModule());
  }
}
