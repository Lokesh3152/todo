import 'package:flutter/material.dart';
import 'package:to_dos/db/database.dart';
import 'package:to_dos/db/model.dart';
import 'package:to_dos/screens/settings.dart';
import 'package:to_dos/screens/taskpage.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Future<List<Task>> _taskList;

  void initState() {
    super.initState();
    _updateTaskList();
  }

  _updateTaskList() {
    setState(() {
      _taskList = DatabaseHelper.instance.getTaskList();
    });
  }

  Color bgColor = Color(0xffFCFCFC);
  Color titleColor = Color(0xff161D6F);
  Color fabColor = Color(0xff7579E7);

  Widget buildtodo(int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(35, 5, 35, 5),
      child: CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          "Todo1",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w200, color: Colors.black),
        ),
        subtitle: Text("9:30PM-High"),
        value: false,
        onChanged: (value) {},
        checkColor: Colors.white,
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
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(
                  Icons.settings,
                  size: 25,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Settings()),
                  );
                },
              ),
            ),
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
                    text: "$completedTaskCount/${snapshot.data.length} Completed",
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
      body: FutureBuilder(
          future: _taskList,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 10,
                ),
                child: Text(
                  'Looks\nLike There Are\nNothing\nTo-do',
                  style: TextStyle(
                    color: Colors.black12,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              );
            }
            final int _completedTaskCount = snapshot.data.where({Task task} => task.status == 1).toList().length;
            return ListView.builder(
              itemCount: snapshot.data.length,
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
                return buildtodo(snapshot.data[index]);
              },
            );
          }),
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
