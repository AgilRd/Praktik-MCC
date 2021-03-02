import 'package:flutter/material.dart';
import 'homepage.dart';

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
  String name;
  TextEditingController controller = new TextEditingController();

  void click() {
    this.name = controller.text;
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MyHomePage(this.name)));
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: TextField(
              controller: this.controller,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: ("type Your Name(can be anonymous)"),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 5, color: Colors.black)),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.done),
                    splashColor: Colors.deepOrange,
                    tooltip: "Submit",
                    onPressed: this.click,
                  ))),
        ));
  }
}
