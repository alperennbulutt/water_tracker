// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:intl/intl.dart';

import '../../models/photos_model.dart';

class HomePage extends StatelessWidget {
  late PhotosModel photosModel;

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = new DateTime.now();
    String formatter = DateFormat('yMd').format(now);
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () => FirebaseAuth.instance.signOut(),
              child: Icon(Icons.logout)),
          title: Text(formatter),
          toolbarHeight: 110,
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
        body: Column(
          children: [
            Text('HomePage'),
          ],
        ));
  }
}
