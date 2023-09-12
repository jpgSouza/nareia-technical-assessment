import 'package:localization/localization.dart';

extension StringExtension on String {
  String translate([List<String> args = const []]) => i18n(args);
}
