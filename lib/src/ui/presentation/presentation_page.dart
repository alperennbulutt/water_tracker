import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:water_tracker/src/constants/app_theme.dart';
import 'package:water_tracker/src/constants/font_family.dart';
import 'package:water_tracker/src/constants/local_storage_constants.dart';
import 'package:water_tracker/src/controller/presentation/presentation_controller.dart';
import 'package:water_tracker/src/data/local_storage.dart';
import 'package:water_tracker/src/utils/routes/app_pages.dart';
import 'package:water_tracker/src/widgets/custom_elevated_button.dart';

class PresenttionPage extends GetView<PresentationController> {
  @override
  Widget build(BuildContext context) {
    final localStorage = LocalStorage();
    PageDecoration pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 21,
        fontFamily: FontFamily.poppinsLightItalic,
      ),
      bodyTextStyle: TextStyle(
        fontSize: 15,
        color: Color.fromRGBO(40, 40, 48, 0.64),
        height: 1.5,
      ),
      imageAlignment: Alignment.center,
      pageColor: Colors.white,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: IntroductionScreen(
        pages: [
          // standart sayfalar
          PageViewModel(
            title: "1.sayfa",
            body: "body",
            image: _buildImage('foto1.jpeg'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "2.sayfa",
            body: "body",
            image: _buildImage('foto1.jpeg'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "3.sayfa",
            body: "body",
            image: _buildImage('foto1.jpeg'),
            decoration: pageDecoration,
          ),

          // son sayfa olacak

          PageViewModel(
              title: "son sayfa",
              body: "body",
              image: _buildImage('foto1.jpeg'),
              decoration: pageDecoration,
              footer: ElevatedButtonWidget(
                text: 'Haydi Ba??layal??m!',
                onPressed: () {
                  localStorage.saveBoolean(
                      LocalStorageConstants.isPresentationPageWatched, true);
                  print('pressed');
                  Get.toNamed(Routes.LOGINPAGE);
                },
              )),
        ],
        done: Text('Atla', style: TextStyle(fontWeight: FontWeight.w600)),
        onDone: () => {
          localStorage.saveBoolean(
              LocalStorageConstants.isPresentationPageWatched, true),
          Get.toNamed(Routes.INITIAL),
        },
        showSkipButton: true,
        skip: Text(
          'Atla',
          style: TextStyle(color: Color.fromRGBO(0, 102, 255, 1), fontSize: 14),
        ),
        next: Icon(Icons.arrow_forward),
        dotsDecorator: getDotDecoration(),
        onChange: (index) => print('Page $index selected'),
        globalBackgroundColor: themeData.backgroundColor,
        nextFlex: 0,
        showDoneButton: false,
        showNextButton: false,
        dotsContainerDecorator: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }
}

// Design part ------------------------------------------------------------------------
DotsDecorator getDotDecoration() => DotsDecorator(
      color: const Color(0xFFBDBDBD),
      //activeColor: Colors.orange,
      size: const Size(10, 10),
      activeSize: const Size(22, 10),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    );

PageDecoration getPageDecoration() => PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 21,
        fontFamily: FontFamily.poppinsSemiBold,
      ),
      bodyTextStyle: const TextStyle(
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
