import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChooseGender extends StatefulWidget {
  const ChooseGender({Key? key}) : super(key: key);

  @override
  _ChooseGenderState createState() => _ChooseGenderState();
}

class _ChooseGenderState extends State<ChooseGender> {
  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Align(
            child: SvgPicture.asset(
              "assets/gender/choose_gender.svg",
            ),
          ),
          Align(
            child: SvgPicture.asset(
              "assets/gender/choose_gender_text.svg",
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: Align(
                child: SvgPicture.asset("assets/gender/choose_male.svg"),
              )),
              Expanded(
                  child: Align(
                child: SvgPicture.asset("assets/gender/choose_female.svg"),
              )),
            ],
          ),
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Align(
                  child: ElevatedButton(
                    style: style,
                    onPressed: () {},
                    child: Icon(Icons.arrow_back_ios),
                  ),
                )),
                Expanded(
                    child: Align(
                  child: ElevatedButton(
                    style: style,
                    onPressed: () {},
                    child: const Text('NEXT'),
                  ),
                ))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
