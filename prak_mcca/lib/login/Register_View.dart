import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prak_mcca/login/login2.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<FirebaseUser> _register() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text))
        .user;
    return user;
  }

  void clickSubmit() {
    _register();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage2()),
        (route) => false);
  }

  Widget _formResgister() {
    return Form(
      key: _formKey,
      child: Column(
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
                  'If you want you can make your account',
                  style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                ),
              ),
            ]),
          ),
          Container(
            padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Please enter your email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
                  obscureText: true,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },
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
                  clickSubmit();
                },
                child: Center(
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _formResgister(),
    );
  }
}
