import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:intl/intl.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

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
          children: [
            Text("Bildirim aç/kapat : "),
            Switch(value: true, onChanged: (value) {}),
          ],
        ),
      ]),
    );
  }
}
