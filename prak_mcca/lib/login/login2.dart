import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prak_mcca/homepage/homepage.dart';
import 'package:prak_mcca/auth/auth.dart';

class LoginPage2 extends StatefulWidget {
  @override
  _LoginPage2State createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  FirebaseUser user;

  @override
  void initState() {
    super.initState();
    signOutGoogle();
  }

  void click() {
    signInWithGoogle().then((user) => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(user)))
        });
  }

  void anon() {
    signInAnon().then((user) => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(user.displayName)))
        });
  }

  Widget anonButton() {
    // ignore: deprecated_member_use
    return OutlineButton(
        onPressed: anon,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
        splashColor: Colors.black,
        borderSide: BorderSide(color: Colors.black),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image(image: AssetImage('images/anonymous.png'), height: 35),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Sign In Anonymously',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              )
            ],
          ),
        ));
  }

  Widget googleloginButton() {
    // ignore: deprecated_member_use
    return OutlineButton(
        onPressed: click,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
        splashColor: Colors.greenAccent,
        borderSide: BorderSide(color: Colors.greenAccent),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image(image: AssetImage('images/google_logo.png'), height: 35),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Sign In with Google',
                  style: TextStyle(color: Colors.green, fontSize: 16),
                ),
              )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 55.0, 0.0, 0.0),
                child: Text(
                  'Hallo',
                  style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 130.0, 0.0, 0.0),
                child: Text(
                  'Selamat Datang.',
                  style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                ),
              ),
            ]),
          ),
          Container(
            padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
                ),
                SizedBox(height: 10.0),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
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
                onTap: () {},
                child: Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Container(
              height: 40,
              child: googleloginButton(),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Container(
              height: 40,
              child: anonButton(),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Belum punya akun ?',
                style: TextStyle(fontFamily: 'Montserrat '),
              ),
              SizedBox(width: 5.0),
              InkWell(
                onTap: () {},
                child: Text(
                  'Daftar',
                  style: TextStyle(
                      color: Colors.green,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
