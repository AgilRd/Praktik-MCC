import 'package:flutter/material.dart';
import 'package:prak_mcca/login/login.dart';
import 'package:prak_mcca/auth/auth.dart';

import 'login/login2.dart';
//import 'splasScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: LoginPage(),
    );
  }
}
