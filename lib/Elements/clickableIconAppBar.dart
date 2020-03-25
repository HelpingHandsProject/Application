import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helping_hands/constants/colors.dart';

class ClickableIconAppBar extends StatelessWidget with PreferredSizeWidget {
  ClickableIconAppBar({
    Key key,
    @required this.titleText,
    @required this.icon,
    @required this.buttonText,
    @required this.onPressedFunction,
  }) : super(key: key);

  final String titleText;
  final IconData icon;
  final String buttonText;
  final Function onPressedFunction;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      elevation: 0.0,
      title: Text(titleText),
      centerTitle: true,
      actions: <Widget>[
        FlatButton.icon(
          icon: Icon(icon),
          label: Text(buttonText),
          textColor: lightTextColor,
          onPressed: onPressedFunction,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
