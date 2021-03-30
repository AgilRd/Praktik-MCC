import 'package:flutter/material.dart';
import 'package:prak_mcca/splasScreen2.dart';

import 'homepage/textInput.dart';
import 'login/login.dart';
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
      home: LoginPage2(),
    );
  }
}
