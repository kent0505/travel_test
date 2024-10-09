import 'package:hive_flutter/hive_flutter.dart';

import '../models/flight.dart';
import '../models/plan.dart';
import '../utils.dart';

class DB {
  static String boxName = 'travel_test_box';
  static String keyName = 'flightsList';
  static List<Flight> flightsList = [];
}

Future<void> initHive() async {
  try {
    await Hive.initFlutter();
    // await Hive.deleteBoxFromDisk(DB.boxName);
    Hive.registerAdapter(FlightAdapter());
    Hive.registerAdapter(PlanAdapter());
  } catch (e) {
    logger(e);
  }
}

Future<void> getFlights() async {
  try {
    final box = await Hive.openBox(DB.boxName);
    List data = box.get(DB.keyName) ?? [];
    DB.flightsList = data.cast<Flight>();
    logger(DB.flightsList.length);
  } catch (e) {
    logger(e);
  }
}

Future<void> updateFlights() async {
  try {
    final box = await Hive.openBox(DB.boxName);
    box.put(DB.keyName, DB.flightsList);
    DB.flightsList = await box.get(DB.keyName);
  } catch (e) {
    logger(e);
  }
}
