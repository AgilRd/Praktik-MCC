import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prak_mcca/homepage/homepage.dart';
import 'package:prak_mcca/homepage/profile_view.dart';

// ignore: camel_case_types
class navbar extends StatefulWidget {
  final FirebaseUser user;
  navbar(this.user);

  @override
  _navbarState createState() => _navbarState();
}

// ignore: camel_case_types
class _navbarState extends State<navbar> {
  FirebaseUser user;
  int _currentIndex = 0;

  // ignore: missing_return
  Widget getPage(int index) {
    switch (index) {
      case 0:
        return MyHomePage(widget.user);
        break;
      case 1:
        return ProfileView(widget.user);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getPage(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        iconSize: 25,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              // ignore: deprecated_member_use
              title: Text("Home"),
              backgroundColor: Colors.redAccent),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              // ignore: deprecated_member_use
              title: Text("Profile"),
              backgroundColor: Colors.redAccent),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
