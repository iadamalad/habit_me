import 'package:flutter/material.dart';
import 'package:habit_me/screens/add_habit_screen.dart';
import 'package:intl/intl.dart';

class HabitScreen extends StatefulWidget {
  @override
  _HabitScreenState createState() => _HabitScreenState();
}

class _HabitScreenState extends State<HabitScreen> {
  final now = DateTime.now();
  List<int> listOfDates;

  @override
  void initState() {
    super.initState();
    DateTime date = DateTime(now.year, now.month + 1, 0);
    listOfDates = List<int>.generate(date.day, (i) => i + 1);
    for (int item in listOfDates) {
      print(
          "$item ${DateFormat('EEEE').format(DateTime(now.year, now.month, item))}");
    }
  }

  Widget _buildHabit(index) {
    return Container(
      height: 120,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF303137),
      ),
      child: ListTile(
          title: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Medidation",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.w600)),
              Row(
                children: <Widget>[
                  Text(
                    "Everyday",
                    style: TextStyle(color: Color(0xFF636368)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.notifications,
                    color: Color(0xFFFFB329),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 10,
                  );
                },
                itemCount: listOfDates.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return (Column(
                    children: <Widget>[
                      Text(DateFormat('EEEE')
                          .format(
                              DateTime(now.year, now.month, listOfDates[index]))
                          .substring(0, 3)),
                      SizedBox(
                        height: 5,
                      ),
                      Text((index + 1).toString(),
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  ));
                }),
          )
        ],
      )),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.add),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddHabitScreen())),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).backgroundColor,
          title: Text(
            "Habits",
            style: TextStyle(
              fontFamily: 'Quicksand',
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 40,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, index) {
            return _buildHabit(index);
          },
        ));
  }
}
