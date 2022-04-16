import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChooseGender extends StatefulWidget {
  const ChooseGender({Key? key}) : super(key: key);

  @override
  _ChooseGenderState createState() => _ChooseGenderState();
}

class _ChooseGenderState extends State<ChooseGender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          SvgPicture.asset("assets/gender/choose_gender.svg",
              fit: BoxFit.scaleDown),
        ],
      ),
    );
  }
}
