import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helping_hands/Constants/colors.dart';
import 'package:helping_hands/Elements/logoutAppBar.dart';
import 'package:helping_hands/services/auth.dart';

class VerifyEmail extends StatefulWidget{

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
      body: Column(
        children: <Widget>[
          SizedBox(height: 150.0),
          Center(child: Text("Please Confim your E-Mail by clicking the Link we sent you")),
          SizedBox(height: 20.0),
          RaisedButton(
            color: primaryColor,
            child: Text(
              'Send E-Mail verification code again',
              style: TextStyle(color: lightTextColor),
            ),
            onPressed: verifyUserEmailButton
        ),]
      ),
    );
  }

  Future verifyUserEmailButton() async {
    _auth.verifyUserEmail(widget.user);
    await _auth.signOut();
  }
}