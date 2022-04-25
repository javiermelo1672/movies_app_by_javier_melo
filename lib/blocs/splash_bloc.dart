import 'package:leal_test_by_javier_melo/app/settings/app_localizations.dart';
import 'package:leal_test_by_javier_melo/app/shared_preferences/shared_preferences/shared_preferences_data.dart';
import 'package:leal_test_by_javier_melo/blocs/providers/bloc.dart';

class SplashBloc extends Bloc {
  final _preferenceData = SharedPreferenceData();
  AppLocalizations? l10n;

  iniPrefs() async {
    _preferenceData.initPrefs();
  }

  Future<bool> validateLoginState() async {
    String name = await _preferenceData.getSharedPreferenceValueString("name");
    if (name == "") {
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  @override
  void dispose() {}
}
