import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_dos/screens/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme:
              GoogleFonts.nunitoSansTextTheme(Theme.of(context).textTheme)),
      debugShowCheckedModeBanner: false,
      title: "my todo list",
      home: homescreen(),
    );
  }
}
