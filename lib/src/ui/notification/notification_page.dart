import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('bildirim sayfasına düştü');
    return Scaffold(
      body: Column(children: [Text('Notification came!!')]),
    );
  }
}
