import 'package:flutter/material.dart';

class Taskpage extends StatefulWidget {
  @override
  _TaskpageState createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {
  final _formkey = GlobalKey<FormState>();
  String _title = '';
  String _desc = '';
  String _priority;
  DateTime _date = DateTime.now();

  final List<String> _priorites = ['none', 'low', 'medium', 'high'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 30,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Form(
                    key: _formkey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 50.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Enter task name',
                                border: InputBorder.none),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 1.0),
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            decoration: InputDecoration(
                                hintText: 'Enter Description',
                                border: InputBorder.none),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: DropdownButtonFormField(
                            icon: Icon(Icons.arrow_drop_down_circle_outlined),
                            iconSize: 28,
                            iconEnabledColor: Theme.of(context).primaryColor,
                            items: _priorites.map((String priority) {
                              return DropdownMenuItem(
                                value: priority,
                                child: Text(
                                  priority,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              );
                            }).toList(), //map
                            style: TextStyle(fontSize: 20),
                            decoration: InputDecoration(
                              labelText: 'priority',
                              labelStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                              ),
                              border: InputBorder.none,
                            ),
                            validator: (input) =>
                                _priority == null ? 'select priority' : null,
                            onChanged: (value) {
                              setState(() {
                                _priority = value;
                              });
                            },
                            value: _priority,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
