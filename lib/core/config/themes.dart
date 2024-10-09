import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

final theme = ThemeData(
  useMaterial3: false,
  primarySwatch: Colors.grey,
  fontFamily: Fonts.regular,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColors.blue,
    selectionColor: AppColors.blue.withOpacity(0.5),
    selectionHandleColor: AppColors.blue,
  ),
  colorScheme: ColorScheme.fromSwatch(
    accentColor: Colors.grey,
  ),
  dialogTheme: const DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
  ),
);

const cupertinoTheme = CupertinoThemeData(
  textTheme: CupertinoTextThemeData(
    textStyle: TextStyle(
      fontFamily: Fonts.regular,
      color: AppColors.black,
    ),
    dateTimePickerTextStyle: TextStyle(
      color: AppColors.white,
      decorationColor: AppColors.red,
      fontSize: 20,
      fontFamily: Fonts.regular,
    ),
  ),
);
