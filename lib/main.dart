import 'package:flutter/material.dart';
import 'package:habit_me/screens/habit_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          backgroundColor: Color(272830),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(headline1: TextStyle(color: Colors.white))),
      home: HabitScreen(),
    );
  }
}
