// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: Calender(),
    );
  }
}

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  String day = "";
  String date = "";
  String time = "";
  String str = "";

  changeDateTime() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        day = DateFormat("EEEE").format(DateTime.now());
        date = DateFormat("MMMM d , yyyy").format(DateTime.now());
        time = DateFormat("hh:mm:ss a").format(DateTime.now());
      });
    });
  }

  print_hi() {
    Timer(Duration(seconds: 5), () {
      setState(() {
        str = "Hi   ^_^";
      });
    });
  }

// initState() --> it is excute w or call when app start for first time
//تستدعى عندما يتم تشغيل التطبيق لاول مرة فقط
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeDateTime();
    print_hi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 40, 34),
      appBar: AppBar(
        title: Text(
          "Date and Time APP",
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        backgroundColor: Color.fromARGB(255, 57, 73, 80),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Today's Date is $day",
              style: TextStyle(color: Colors.white, fontSize: 27),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              date,
              style: TextStyle(color: Colors.white, fontSize: 27),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              time,
              style: TextStyle(color: Colors.white, fontSize: 27),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              str,
              style: TextStyle(color: Colors.white, fontSize: 27),
            ),
          ],
        ),
      ),
    );
  }
}
