import 'package:flutter/material.dart';
import 'package:habit_me/models/habit_model.dart';

class AddHabitScreen extends StatefulWidget {
  final HabitModel habit;

  AddHabitScreen({this.habit});
  @override
  _AddHabitScreenState createState() => _AddHabitScreenState();
}

class _AddHabitScreenState extends State<AddHabitScreen> {
  String _title;
  int _frequency;
  final List<String> _frequencies = [
    "Everyday",
    "Every other day",
    "Every two days"
  ];

  void initState() {
    super.initState();
    if (widget.habit != null) {
      _title = widget.habit.title;
      _frequency = widget.habit.frequency;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 80, horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Icon(
                Icons.arrow_back_ios,
                size: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Add a habit",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 40,
            ),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Quicksand',
                        color: Colors.white),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color: Colors.greenAccent, width: 5.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: "Ex. Medidating",
                        hintStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: "Quicksand",
                            fontStyle: FontStyle.italic),
                        labelText: "Title",
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        )),
                    validator: (input) =>
                        input.trim() == "" ? "Enter a proper habit" : null,
                    onSaved: (input) => _title = input,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: DropdownButtonFormField(
                      value: _frequency,
                      icon: Icon(Icons.arrow_downward_rounded),
                      items: _frequencies
                          .map(
                            (String frequency) => DropdownMenuItem(
                              value: frequency,
                              child: Text(
                                frequency,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.white))),
                      validator: (input) => input == null
                          ? "Please choose a proper frequency"
                          : null,
                      onChanged: (value) {
                        setState(() {
                          _frequency = _frequencies.indexOf(value);
                        });
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
