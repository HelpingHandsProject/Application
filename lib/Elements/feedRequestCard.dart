import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helping_hands/Constants/colors.dart';

import 'baseRequestContent.dart';

class FeedRequestCard extends StatefulWidget {
  FeedRequestCard(
      {@required this.title,
      @required this.distance,
      @required this.namePersonRequesting,
      @required this.message,
      @required this.dueDate});

  final String title;
  final String distance;
  final String namePersonRequesting;
  final String dueDate;
  final String message;

  @override
  _FeedRequestCardState createState() => _FeedRequestCardState();
}

class _FeedRequestCardState extends State<FeedRequestCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 4.0, bottom: 0.0, left: 10.0, right: 10.0),
      child: Card(
        shape: RoundedRectangleBorder(
            side: new BorderSide(color: unselectedItemColor, width: 2.0),
            borderRadius: BorderRadius.circular(4.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.fromLTRB(15, 10.0, 0, 8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseRequestContent(
                        title: widget.title,
                        distance: widget.distance,
                        namePersonRequesting: widget.namePersonRequesting,
                        dueDate: widget.dueDate),
                    Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                      constraints: BoxConstraints(maxHeight: 128),
                      child: Text(widget.message,
                          style: TextStyle(
                            color: blackTextColor,
                            fontSize: 18.0,
                          )),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
