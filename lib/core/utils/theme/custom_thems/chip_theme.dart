import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class MyChipTheme{
  MyChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: RColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: RColors.black),
    selectedColor: RColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
    checkmarkColor: RColors.white
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
      disabledColor: RColors.darkerGrey,
      labelStyle: const TextStyle(color: RColors.white),
      selectedColor: RColors.primary,
      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
      checkmarkColor: RColors.white
  );
}