import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class MyChipTheme{
  MyChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: TColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: TColors.black),
    selectedColor: TColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
    checkmarkColor: TColors.white
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
      disabledColor: TColors.darkerGrey,
      labelStyle: const TextStyle(color: TColors.white),
      selectedColor: TColors.primary,
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
      checkmarkColor: TColors.white
  );
}