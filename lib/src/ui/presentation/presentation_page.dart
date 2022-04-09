import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:water_tracker/src/constants/app_theme.dart';
import 'package:water_tracker/src/constants/font_family.dart';
import 'package:water_tracker/src/controller/presentation/presentation_controller.dart';
import 'package:water_tracker/src/ui/home/home_page.dart';
import 'package:water_tracker/src/widgets/custom_elevated_button.dart';

class PresenttionPage extends GetView<PresentationController> {
  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    PageDecoration pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 21,
        fontFamily: FontFamily.poppinsLightItalic,
      ),
      bodyTextStyle: const TextStyle(
        fontSize: 15,
        color: Color.fromRGBO(40, 40, 48, 0.64),
        height: 1.5,
      ),
      imageAlignment: Alignment.center,
      pageColor: Colors.white,
    );

    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "title",
            body: "body",
            image: _buildImage('foto1.jpeg'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: '',
            bodyWidget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            footer: ElevatedButtonWidget(
              text: 'Ana Sayfa',
            ),
            decoration: pageDecoration.copyWith(
              bodyFlex: 2,
              imageFlex: 4,
              bodyAlignment: Alignment.bottomCenter,
              imageAlignment: Alignment.topCenter,
            ),
            image: _buildImage('foto1.jpeg'),
            reverse: true,
          ),
        ],
        done: Text('Bitir',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.red)),
        onDone: () => goToHome(context),
        showSkipButton: true,
        skip: Text(
          'İlerle',
          style: TextStyle(color: Color.fromRGBO(0, 102, 255, 1), fontSize: 14),
        ),
        onSkip: () => goToHome(context),
        next: Icon(Icons.arrow_forward),
        dotsDecorator: getDotDecoration(),
        onChange: (index) => print('Page $index selected'),
        globalBackgroundColor: themeData.backgroundColor,
        nextFlex: 0,
        // isProgressTap: false,
        // isProgress: false,
        showDoneButton: false,
        showNextButton: false,
        // freeze: true,
        // animationDuration: 1000,

        dotsContainerDecorator: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => HomePage()),
      );
}

// Design part ------------------------------------------------------------------------
DotsDecorator getDotDecoration() => DotsDecorator(
      color: Color(0xFFBDBDBD),
      //activeColor: Colors.orange,
      size: Size(10, 10),
      activeSize: Size(22, 10),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    );

PageDecoration getPageDecoration() => PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 21,
        fontFamily: FontFamily.poppinsSemiBold,
      ),
      bodyTextStyle: TextStyle(
        fontSize: 15,
        color: Color.fromRGBO(40, 40, 48, 0.64),
        height: 1.5,
      ),
      imageAlignment: Alignment.center,
      pageColor: Colors.white,
    );

Widget _buildImage(String assetName, [double width = 1500]) {
  return Image.asset('assets/introduction/$assetName', width: width);
}
