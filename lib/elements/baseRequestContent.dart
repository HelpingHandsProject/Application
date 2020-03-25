import 'package:flutter/cupertino.dart';
import 'package:helping_hands/Constants/colors.dart';

class BaseRequestContent extends StatelessWidget {
  BaseRequestContent(
      {@required this.title,
      @required this.distance,
      @required this.namePersonRequesting,
      @required this.dueDate});

  final String title;
  final String distance;
  final String namePersonRequesting;
  final String dueDate;

  @override
  Widget build(BuildContext context) {
    return Wrap(children: <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                bottom: 3, // space between underline and text
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: blackTextColor, // Text colour here
                width: 1.5, // Underline width
              ))),
              child: Text(
                title,
                style: TextStyle(
                  color: blackTextColor,
                  fontSize: 32.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Text(distance,
                  style: TextStyle(
                    color: blackTextColor,
                    fontSize: 16.0,
                  )),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(4, 0, 5, 4),
        child: Text(namePersonRequesting + " - " + dueDate,
            style: TextStyle(
              color: blackTextColor,
              fontSize: 13.5,
            )),
      )
    ]);
  }
}
