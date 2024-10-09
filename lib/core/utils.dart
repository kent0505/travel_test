import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

String timestampToString(int timestamp) {
  // timestamp to 22.06.2000
  try {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('dd.MM.yyyy').format(date);
  } catch (e) {
    return 'Error';
  }
}

String dateToString(DateTime date) {
  // DateTime to 22.06.2000
  try {
    return DateFormat('dd.MM.yyyy').format(date);
  } catch (e) {
    return 'Error';
  }
}

String timeToString(DateTime time) {
  // DateTime to 22:00
  try {
    return DateFormat('HH:mm').format(time);
  } catch (e) {
    return 'Error';
  }
}

DateTime stringToDate(String date) {
  // 22.06.2000 to DateTime
  try {
    return DateFormat('dd.MM.yyyy').parse(date);
  } catch (e) {
    return DateTime.now();
  }
}

String getDateDiff(
  String date1,
  String date2,
  String time1,
  String time2,
) {
  DateTime dateTime1 = DateTime.parse("${convertToIsoFormat(date1)}T$time1:00");
  DateTime dateTime2 = DateTime.parse("${convertToIsoFormat(date2)}T$time2:00");
  Duration difference = dateTime2.difference(dateTime1);
  int hours = difference.inHours;
  int minutes = difference.inMinutes.remainder(60);
  String h = '${hours}h';
  String m = '${minutes}min'.replaceAll('-', '').replaceAll('0min', '');
  return '$h $m';
}

String convertToIsoFormat(String date) {
  List<String> parts = date.split('.');
  return '${parts[2]}-${parts[1]}-${parts[0]}';
}

double getStatusBar(BuildContext context) {
  return MediaQuery.of(context).viewPadding.top;
}

double getBottom(BuildContext context) {
  return MediaQuery.of(context).viewPadding.bottom;
}

double getWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

bool getButtonActive(List<TextEditingController> controllers) {
  for (TextEditingController controller in controllers) {
    if (controller.text.isEmpty) return false;
  }
  return true;
}

void logger(Object message) {
  try {
    developer.log(message.toString());
  } catch (e) {
    debugPrint(e.toString());
  }
}
