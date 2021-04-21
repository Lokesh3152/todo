import 'package:flutter/material.dart';

class Taskpage extends StatefulWidget {
  @override
  _TaskpageState createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {
  final _formkey = GlobalKey<FormState>();
  // ignore: unused_field
  String _title = '';
  String _priority;
  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController _timecontroller = TextEditingController();
  final List<String> _priorites = ['none', 'low', 'medium', 'high'];

  _timepicker() async {
    final TimeOfDay pickedS = await showTimePicker(
        context: context,
        initialTime: selectedTime,
        builder: (BuildContext context, Widget child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child,
          );
        });

    if (pickedS != null && pickedS != selectedTime) {
      setState(() {
        selectedTime = pickedS;
      });
      _timecontroller.text = selectedTime.format(context);
    }
  }

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
                          padding: const EdgeInsets.fromLTRB(10, 50, 50, 30),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter task name',
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 20, 10, 30),
                          child: TextFormField(
                            readOnly: true,
                            showCursor: false,
                            controller: _timecontroller,
                            onTap: _timepicker,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: 'Select TIme',
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
                            elevation: 16,
                            iconSize: 28,
                            dropdownColor: Colors.blue[50],
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
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 380, 0, 0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Add',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
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
