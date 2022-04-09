import 'package:flutter/material.dart';
import 'package:water_tracker/src/constants/colors.dart';
import 'package:water_tracker/src/constants/paddings.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final Color? buttonColor;
  final Color? disabledColor;

  ElevatedButtonWidget(
      {Key? key,
      required this.text,
      this.onPressed,
      this.buttonColor,
      this.disabledColor,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultHorizontalPadding),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled))
                return Color.fromRGBO(204, 215, 227, 1);

              return Colors.amber;
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) return Colors.white;

              return Colors.white;
            },
          ),
          textStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled))
                return TextStyle(fontSize: 16);

              return TextStyle(fontSize: 16);
            },
          ),
          shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled))
                return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(buttonBorderRadius),
                );

              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(buttonBorderRadius),
              );
            },
          ),
          minimumSize: MaterialStateProperty.resolveWith<Size>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled))
                return Size(double.infinity, 63.0);

              return Size(double.infinity, 63.0);
            },
          ),
        ),
        onPressed: this.onPressed,
        child: Text(
          this.text,
          textAlign: TextAlign.center,
          style: textStyle,
        ),
      ),
    );
  }
}
