import 'package:shared_preferences/shared_preferences.dart';

abstract class RestaurantSettingPreferences {
  saveSetting(bool value);

  Future<bool> ambilSetting();
}

class RestaurantSettingPreferencesac extends RestaurantSettingPreferences {
  @override
  Future<bool> ambilSetting() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return _prefs.getBool('nofitikasi');
  }

  @override
  saveSetting(bool value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setBool('nofitikasi', value);
  }
}
