import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  static const Map<int, Color> orange = const <int, Color>{
    50: const Color.fromRGBO(0, 100, 30, 1),
    100: const Color.fromRGBO(0, 110, 35, 1),
    200: const Color.fromRGBO(0, 120, 40, 1),
    300: const Color.fromRGBO(0, 130, 45, 1),
    400: const Color.fromRGBO(0, 140, 50, 1),
    500: const Color.fromRGBO(0, 150, 55, 1),
    600: const Color.fromRGBO(0, 160, 60, 1),
    700: const Color.fromRGBO(0, 170, 65, 1),
    800: const Color.fromRGBO(0, 180, 70, 1),
    900: const Color.fromRGBO(0, 190, 75, 1)
  };
}

const Color textFieldTitleColor = Color.fromRGBO(40, 40, 48, 1);
const Color textFieldHintColor = Color.fromRGBO(194, 194, 194, 1);
const Color textFormFieldBorderColor = Color.fromRGBO(204, 215, 227, 1);
const Color buttonBackgroundColor = Color.fromRGBO(0, 102, 255, 1);
const Color successButtonColor = Color.fromRGBO(39, 173, 96, 1);
const Color radioColor = Color.fromRGBO(0, 102, 255, 1);
const Color successBttonDisabledColor = Color.fromRGBO(204, 234, 223, 1);
