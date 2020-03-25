import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helping_hands/constants/colors.dart';
import 'package:helping_hands/constants/icons.dart';
import 'package:helping_hands/elements/logoutAppBar.dart';
import 'package:helping_hands/services/auth.dart';

class VerifyEmail extends StatefulWidget {
  final FirebaseUser user;

  VerifyEmail({this.user});

  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: LogoutAppBar(titleText: 'Helping Hands'),
      body: Column(children: <Widget>[
        SizedBox(height: 150.0),
        Center(
          child: Column(
            children: <Widget>[
              Text("Please confim your E-Mail"),
              Text("Just click the Link we sent you "),
              SizedBox(height: 10.0),
              Icon(emailSentIcon),
              SizedBox(height: 10.0),
              Text("Once you confirmed your mail sign in again")
            ],
          ),
        ),
        SizedBox(height: 20.0),
        RaisedButton(
            color: primaryColor,
            child: Text(
              'Send E-Mail verification code again',
              style: TextStyle(color: lightTextColor),
            ),
            onPressed: verifyUserEmailButton),
      ]),
    );
  }

  Future verifyUserEmailButton() async {
    _auth.verifyUserEmail(widget.user);
    await _auth.signOut();
  }
}
