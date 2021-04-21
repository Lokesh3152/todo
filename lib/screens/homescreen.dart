import 'package:flutter/material.dart';
import 'package:to_dos/screens/settings.dart';
import 'package:to_dos/screens/taskpage.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Color bgColor = Color(0xffFCFCFC);
  Color titleColor = Color(0xff161D6F);
  Color fabColor = Color(0xff7579E7);

  Widget buildtodo(int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 5, 5, 5),
      child: CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          "Todo1",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w200, color: Colors.black),
        ),
        subtitle: Text("9:30PM-High"),
        value: false,
        onChanged: (value) {
          print("value");
        },
        activeColor: Theme.of(context).primaryColor,
        contentPadding: EdgeInsets.all(0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings_applications_rounded,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settings()),
              );
            },
          ),
        ],
        toolbarHeight: 250,
        backgroundColor: bgColor,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(30, 80, 10, 0),
          child: RichText(
            text: TextSpan(
                text: "Hey Lucky your's\n",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  height: 1,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: "To-Do's\n",
                    style: TextStyle(
                      fontSize: 46,
                      fontWeight: FontWeight.bold,
                      color: titleColor,
                      height: 1.5,
                    ),
                  ),
                  TextSpan(
                    text: "0/3 Completed",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                      color: Colors.black,
                      height: 3.5,
                    ),
                  ),
                ]),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[],
              ),
            );
          }
          return buildtodo(index);
        },
      ),
      backgroundColor: bgColor,

      //FAB
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(_createRoute());
        },
        label: Text("Add"),
        icon: Icon(Icons.add),
        backgroundColor: fabColor,
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Taskpage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0, 1.0);
        var end = Offset.zero;
        var curve = Curves.easeIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
