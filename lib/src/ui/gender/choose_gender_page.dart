import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/custom_gradient_text.dart';

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
          SizedBox(
            height: 20,
          ),
          Align(
            child: GradientText(
              'Choose your Gender',
              style: const TextStyle(fontSize: 20),
              gradient: LinearGradient(colors: [
                Color.fromRGBO(27, 174, 238, 1),
                Color.fromRGBO(255, 69, 147, 1),
              ]),
            ),
          ),
          SizedBox(
            height: 20,
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
          Spacer(),
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Align(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ))),
                    onPressed: () {},
                    child: Icon(Icons.arrow_back_ios),
                  ),
                )),
                Expanded(
                    child: Align(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ))),
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
