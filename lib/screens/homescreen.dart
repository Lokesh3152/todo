import 'package:flutter/material.dart';

class homescreen extends StatefulWidget {
  @override
  _homescreenState createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  Color bg_color = Color(0xffFCFCFC);
  Color title_color = Color(0xff161D6F);
  Color FAB_color = Color(0xff7579E7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 100,
              ),
              child: RichText(
                  text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: [
                    TextSpan(
                        text: "Hey Lucky\n",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            decoration: TextDecoration.none,
                            height: 1.5)),
                    TextSpan(
                        text: "To-Do's",
                        style: TextStyle(
                            color: title_color,
                            fontWeight: FontWeight.bold,
                            fontSize: 36,
                            height: 1.6,
                            decoration: TextDecoration.none))
                  ]))
              //  Text(
              //   "Hey Lucky",
              //   style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              // ),
              )),
      backgroundColor: bg_color,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text("Add"),
        icon: Icon(Icons.add),
        backgroundColor: FAB_color,
      ),
    );
  }
}
