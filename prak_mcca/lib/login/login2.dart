import 'package:flutter/material.dart';
import 'package:prak_mcca/homepage/homepage.dart';
import 'package:prak_mcca/homepage/textInput.dart';

import '../homepage/textInput.dart';

class LoginPage2 extends StatefulWidget{
  @override
  _LoginPage2State createState() =>  _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
       body: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
           Container(
             child: Stack(
               children: <Widget> [
                 Container(
                   padding: EdgeInsets.fromLTRB(15.0, 55.0, 0.0, 0.0),
                   child: Text(
                     'Hallo',
                     style: TextStyle(
                       fontSize: 80.0, fontWeight: FontWeight.bold
                     ),
                   ),
                 ),
                  Container(
                   padding: EdgeInsets.fromLTRB(15.0, 130.0, 0.0, 0.0),
                   child: Text(
                     'Selamat Datang.',
                     style: TextStyle(
                       fontSize: 50.0, fontWeight: FontWeight.bold
                     ),
                   ),
                 ),
                 
               ]
             ),
           ),
           Container(
             padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
             child: Column(
               children: <Widget> [
                 TextField(
                   decoration: InputDecoration(
                     labelText: 'Username',
                     labelStyle: TextStyle(
                       fontFamily: 'Montserrat',
                       fontWeight: FontWeight.bold,
                       color: Colors.grey
                     ),
                     focusedBorder: UnderlineInputBorder(
                       borderSide: BorderSide(color: Colors.green)
                     )
                   ),
                 ),
                 SizedBox(height: 10.0),
                 TextField(
                   decoration: InputDecoration(
                     labelText: 'Password',
                     labelStyle: TextStyle(
                       fontFamily: 'Montserrat',
                       fontWeight: FontWeight.bold,
                       color: Colors.grey
                     ),
                     focusedBorder: UnderlineInputBorder(
                       borderSide: BorderSide(color: Colors.green)
                     )
                   ),
                   obscureText: true,
                 )
               ],
             ),
           ),
           SizedBox(height: 100.0),
           Container(
             height: 40.0,
             child: Material(
               borderRadius: BorderRadius.circular(18.0),
               shadowColor: Colors.greenAccent,
               color: Colors.green,
               elevation: 10.0,
               child: GestureDetector(
                 onTap: () {
                   
                 },
                 child: Center(
                   child: Text(
                     'LOGIN',
                     style:  TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.bold,
                       fontFamily: 'Montserrat'
                     ),
                   ),
                 ),
               ),
             ),
           ),
           SizedBox(height: 15.0,), 
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Text(
                 'Belum punya akun ?',
                 style: TextStyle(
                   fontFamily: 'Montserrat '
                 ),
               ),
               SizedBox(width: 5.0),
                InkWell(
                  onTap: () {},
                  child: Text('Daftar',
                  style:TextStyle(
                    color: Colors.green,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline
                  ),
                  ),
                ),
             ],
           ),
         ],
       ),
    );

  }
}