import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helping_hands/Elements/baseAppBar.dart';
import 'package:helping_hands/Elements/feedRequestCard.dart';
import 'package:helping_hands/Elements/logoutAppBar.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(titleText: 'In your area'),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //These Cards need to be generated at runtime
            FeedRequestCard(
                title: "Go shopping",
                distance: "150 m",
                namePersonRequesting: "Marge Simpson",
                message:
                    "Hey all ;)\nI could need some help with my dog pushel. It would be great if someone could take her for a short walk. I cannot leave the house because I am in quarantine and this is some other blindtext",
                dueDate: "due: 15.01.2020"),
            FeedRequestCard(
                title: "Walk the dog",
                distance: "200 m",
                namePersonRequesting: "Grandpa Simpson",
                message:
                    "Hey all ;)\n\nI could need some help with my dog pushel. It would be great if someone could take her for a short walk. I cannot leave the house because I am in quarantine and this is some other blindtext",
                dueDate: "due: 15.01.2020"),
            FeedRequestCard(
                title: "Exchange a lightbulb",
                distance: "200 m",
                namePersonRequesting: "Bart Simpson",
                message:
                    "Hey all ;)\n\nI could need some help with my dog pushel. It would be great if someone could take her for a short walk. I cannot leave the house because I am in quarantine and this is some other blindtext",
                dueDate: "due: 15.01.2020"),
            FeedRequestCard(
                title: "Give a ride",
                distance: "350 m",
                namePersonRequesting: "Lisa Simpson",
                message:
                    "Hey all ;)\n\nI could need some help with my dog pushel. It would be great if someone could take her for a short walk. I cannot leave the house because I am in quarantine and this is some other blindtext",
                dueDate: "due: 15.01.2020"),
            FeedRequestCard(
                title: "Teach Java",
                distance: "2.2 km",
                namePersonRequesting: "Maggie Simpson",
                message:
                    "Hey all ;)\n\nI could need some help with my dog pushel. It would be great if someone could take her for a short walk. I cannot leave the house because I am in quarantine and this is some other blindtext",
                dueDate: "due: 15.01.2020"),
          ],
        ),
      ),
    );
  }
}
