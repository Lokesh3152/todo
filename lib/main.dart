import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color btn_color = Color(0xff7579E7);
  Color bg_color = Color(0xffFAFAFA);
  Color not_completed = Color(0xffFFC7C7);
  Color completed = Color(0xffC7FFDA);
  Color dark_blue = Color(0xff161D6F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg_color,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {}, label: Text("Add"), icon: Icon(Icons.add)),
    );
  }
}
