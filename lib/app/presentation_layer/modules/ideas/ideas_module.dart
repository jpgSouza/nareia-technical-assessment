import 'package:flutter_modular/flutter_modular.dart';

import '../daily/daily_module.dart';
import 'ideas_page.dart';

class IdeasModule extends Module {
  @override
  void binds(Injector i) {
    DailyModule().binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => const IdeasPage());
  }
}
