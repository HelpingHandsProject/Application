import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helping_hands/Constants/colors.dart';
import 'package:helping_hands/Constants/icons.dart';
import 'package:helping_hands/screens/home/addRequest.dart';
import '../../Elements/logoutAppBar.dart';
import '../../Elements/myRequestCard.dart';

class MyRequests extends StatefulWidget {
  @override
  _MyRequestsState createState() => _MyRequestsState();
}

class _MyRequestsState extends State<MyRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LogoutAppBar(titleText: 'My Requests'),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: Icon(addRequestIcon, size: 40),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddRequest()));
        },
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          //These Cards need to be generated at runtime
          MyRequestCard(
              title: "Go shopping",
              distance: "150 m",
              namePersonRequesting: "Marge Simpson",
              isFinished: false,
              dueDate: "due: 15.01.2020"),
          MyRequestCard(
              title: "Walk the dog",
              distance: "",
              namePersonRequesting: "You",
              isFinished: false,
              dueDate: "every day"),
          MyRequestCard(
              title: "Go shopping",
              distance: "closed",
              namePersonRequesting: "Marge Simpson",
              isFinished: true,
              dueDate: "due: 15.01.2020"),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                'To add a request, press the Plus button',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
