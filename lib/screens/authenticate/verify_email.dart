import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helping_hands/models/user.dart';
import 'package:helping_hands/services/auth.dart';

class VerifyEmail extends StatefulWidget{

  User user;

  VerifyEmail({this.user});

  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Helping Hands'),
        centerTitle: true,
        backgroundColor: Colors.green[600],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              await _auth.signOut();
            },
            textColor: Colors.white,

          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 150.0),
          Center(child: Text("Please Confim your E-Mail by clicking the Link we sent you")),
          SizedBox(height: 20.0),
          RaisedButton(
            color: Colors.green[600],
            child: Text(
              'Send E-Mail verification code again',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              _auth.verifyUserEmail(widget.user.email);
            }
        ),]
      ),
    );
  }
}