import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helping_hands/constants/colors.dart';
import 'package:helping_hands/elements/baseAppBar.dart';
import 'package:helping_hands/elements/formFields.dart';

class AddRequest extends StatefulWidget {
  @override
  _AddRequestState createState() => _AddRequestState();
}

class _AddRequestState extends State<AddRequest> {
  String title = "";
  String message = "";
  String error = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(titleText: 'Request Help'),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                    child: Text(
                      "Title:",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  RequestTitleTextField("Your Title", (val) {
                    setState(() => title = val);
                  }),
                  SizedBox(height: 20.0),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                    child: Text(
                      "Message:",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  RequestMessageTextField("Your Message", (val) {
                    setState(() => message = val);
                  }),
                  SizedBox(height: 20.0),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                    child: Text(
                      "Your Adress:",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  RaisedButton(
                    color: primaryColor,
                    child: Text(
                      'Google Maps Location Picker',
                      style: TextStyle(color: lightTextColor),
                    ),
                    onPressed: () => {},
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    color: primaryColor,
                    child: Text(
                      'Request Help',
                      style: TextStyle(color: lightTextColor),
                    ),
                    onPressed: () => {},
                  ),
                  SizedBox(height: 6.0),
                  SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: errorColor, fontSize: 14.0),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
