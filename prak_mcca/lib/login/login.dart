import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prak_mcca/homepage/homepage.dart';
import 'package:prak_mcca/auth/auth.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Text("Log In Page"),
          shadowColor: Colors.greenAccent,
        ),
        body: Body());
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // String name;
  // TextEditingController controller = new TextEditingController();
  User user;

  @override
  void initState() {
    super.initState();
    signOutGoogle();
  }

  void click() {
    //this.name = controller.text;
    signInWithGoogle().then((user) => {
          this.user = user,
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(user.displayName)))
        });
  }

  Widget googleLoginButton(){
    return OutlineButton(
      onPressed: this.googleLoginButton,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
      splashColor: Colors.grey,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(image: AssetImage('assets/google_logo.png'), height: 35),
          Padding(padding: EdgeInsets.only(left: 10), child: Text('Sign in with Google', style: TextStyle(color: Colors.grey, fontSize: 25)))
        ],
      ))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: googleLoginButton(),
    );
  }
}

