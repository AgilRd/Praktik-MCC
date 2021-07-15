import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prak_mcca/auth/auth.dart';
import 'package:prak_mcca/login/login2.dart';

class ProfileView extends StatefulWidget {
  final FirebaseUser user;
  ProfileView(this.user);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  getProfileData() {
    if (widget.user.photoUrl != null) {
      return Image.network(
        widget.user.photoUrl,
        height: 100,
        width: 100,
      );
    } else {
      return Icon(Icons.account_circle, size: 100);
    }
  }

  Widget displayUserInfo() {
    final userDisplayName = widget.user.displayName;
    return Container(
      padding: EdgeInsets.all(20),
      child: Stack(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: getProfileData(),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Name: ${userDisplayName ?? 'Anonymous'}"),
        ),
        SizedBox(
          height: 30,
        ),
        showSignOut(widget.user.isAnonymous)
      ]),
    );
  }

  Widget showSignOut(bool isAnonymous) {
    if (isAnonymous == true) {
      // ignore: deprecated_member_use
      return RaisedButton(
          color: Colors.deepOrange,
          child: Text("Sign in to support us"),
          onPressed: clickMetu);
    } else {
      // ignore: deprecated_member_use
      return RaisedButton(
          color: Colors.deepOrange,
          child: Text("Sign Out"),
          onPressed: clickMetu);
    }
  }

  void clickMetu() {
    signOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage2()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Container(
              child: displayUserInfo(),
            ),
          ],
        ),
      ),
    );
  }
}
