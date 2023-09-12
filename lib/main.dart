import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  LocalJsonLocalization.delegate.directories = ['lib/i18n'];

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
