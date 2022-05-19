import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = new DateTime.now();
    String formatter = DateFormat('yMd').format(now);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => {
                  FirebaseAuth.instance.signOut(),
                },
            child: Icon(Icons.logout)),
        title: Text(formatter),
        toolbarHeight: 90,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: WaveClipperTwo(),
          child: Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
          ),
        ),
      ),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Kişisel Bilgiler",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          "Cemile Beyza",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Düzen",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "46 kg",
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
        )
      ]),
    );
  }
}
