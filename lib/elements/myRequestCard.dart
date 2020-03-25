import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helping_hands/constants/colors.dart';

import 'baseRequestContent.dart';

class MyRequestCard extends StatefulWidget {
  MyRequestCard(
      {@required this.title,
      @required this.distance,
      @required this.namePersonRequesting,
      @required this.isFinished,
      this.dueDate});

  final String title;
  final String distance;
  final String namePersonRequesting;
  final String dueDate;
  final bool isFinished;

  @override
  _FeedRequestCardState createState() => _FeedRequestCardState();
}

class _FeedRequestCardState extends State<MyRequestCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 8.0, bottom: 0.0, left: 10.0, right: 10.0),
      child: Card(
        shape: widget.isFinished
            ? new RoundedRectangleBorder(
                side: new BorderSide(color: darkTextColor, width: 4.0),
                borderRadius: BorderRadius.circular(4.0))
            : new RoundedRectangleBorder(
                side: new BorderSide(color: primaryColor, width: 4.0),
                borderRadius: BorderRadius.circular(4.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.fromLTRB(15, 10.0, 0, 8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BaseRequestContent(
                        title: widget.title,
                        distance: widget.distance,
                        namePersonRequesting: widget.namePersonRequesting,
                        dueDate: widget.dueDate),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
