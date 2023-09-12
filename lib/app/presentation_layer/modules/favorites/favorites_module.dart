import 'package:flutter_modular/flutter_modular.dart';

import 'favorites_page.dart';

class FavoritesModule extends Module {
  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    r.child(Modular.initialRoute, child: (_) => const FavoritesPage());
  }
}
