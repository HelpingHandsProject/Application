import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ParametrizedAppBar extends StatelessWidget implements PreferredSizeWidget{

  //ParametrizedAppBar(performAction: widget.toggleView(), displayText: 'Sign up for Helping Hands', displayIcon: Icons.person, buttonLabel: 'Sign In'),

  final Function performAction;
  final String displayText;
  final IconData displayIcon;
  final String buttonLabel;
  final AppBar appBar;

  const ParametrizedAppBar({ this.performAction, this.displayText, this.displayIcon,
    this.buttonLabel, this.appBar });

  Widget build(BuildContext context){
    return AppBar(
      backgroundColor: Colors.green[600],
      elevation: 0.0,
      title: Text(displayText),
      actions: <Widget>[
        FlatButton.icon(
          icon: Icon(displayIcon),
          label: Text(buttonLabel),
          onPressed: () =>  performAction(),
        ),
      ],
    );
}
  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}