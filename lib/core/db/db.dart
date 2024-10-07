import 'package:hive_flutter/hive_flutter.dart';

import '../models/test_model.dart';
import '../utils.dart';

class DB {
  static String boxName = 'shablonbox';
  static String keyName = 'modelsList';
  static List<TestModel> modelsList = [];
}

Future<void> initHive() async {
  try {
    await Hive.initFlutter();
    // await Hive.deleteBoxFromDisk(DB.boxName);
    Hive.registerAdapter(TestModelAdapter());
  } catch (e) {
    logger(e);
  }
}

Future<void> getModels() async {
  try {
    final box = await Hive.openBox(DB.boxName);
    List data = box.get(DB.keyName) ?? [];
    DB.modelsList = data.cast<TestModel>();
    logger(DB.modelsList.length);
  } catch (e) {
    logger(e);
  }
}

Future<void> updateModels() async {
  try {
    final box = await Hive.openBox(DB.boxName);
    box.put(DB.keyName, DB.modelsList);
    DB.modelsList = await box.get(DB.keyName);
  } catch (e) {
    logger(e);
  }
}
