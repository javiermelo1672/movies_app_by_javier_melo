import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceData {
  static final SharedPreferenceData _instancia =
      SharedPreferenceData._internal();

  factory SharedPreferenceData() {
    return _instancia;
  }

  SharedPreferenceData._internal();

  late SharedPreferences? _prefs;

  dynamic initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void setSharedPreferenceValueString(String name, String value) {
    _prefs!.setString(name, value);
  }

  Future<String> getSharedPreferenceValueString(String name) async {
    return _prefs!.getString(name) ?? "";
  }
}
