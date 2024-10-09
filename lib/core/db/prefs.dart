import 'package:shared_preferences/shared_preferences.dart';

import '../utils.dart';

String jetlagArrival = '';
String jetlagDeparture = '';
String jetlagTime = '';

Future<bool> getData() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    // await prefs.remove('onboard');
    // await prefs.clear();
    bool onboard = prefs.getBool('onboard') ?? true;
    jetlagArrival = prefs.getString('jetlagArrival') ?? '';
    jetlagDeparture = prefs.getString('jetlagDeparture') ?? '';
    jetlagTime = prefs.getString('jetlagTime') ?? '';
    return onboard;
  } catch (e) {
    logger(e);
    return true;
  }
}

Future<void> saveOnboard() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool('onboard', false);
}

Future<void> saveString(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

Future<void> saveInt(String key, int value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt(key, value);
}

Future<void> saveBool(String key, bool value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool(key, value);
}
