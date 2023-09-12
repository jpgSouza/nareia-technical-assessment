import 'package:flutter_modular/flutter_modular.dart';

import 'daily_page.dart';

class DailyModule extends Module {
  @override
  void binds(Injector i) {}

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
