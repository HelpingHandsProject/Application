import 'package:helping_hands/Constants/colors.dart';
import 'package:helping_hands/Elements/baseAppBar.dart';
import 'package:helping_hands/Elements/formFields.dart';
import 'package:helping_hands/services/auth.dart';
import 'package:helping_hands/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // Text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: backgroundColor,
      appBar: BaseAppBar(titleText: 'Sign up', icon: Icons.person,
          buttonText: "Sign In", onPressedFunction: widget.toggleView),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              EmailTextField((val) {setState(() => email = val);}),
              SizedBox(height: 20.0),
              PasswordTextField((val) {setState(() => password = val);}),
              SizedBox(height: 20.0),
              RaisedButton(
                color: primaryColor,
                child: Text(
                  'Register',
                  style: TextStyle(color: lightTextColor),
                ),
                onPressed: registerWithEmailAndPasswordButton
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
    );
  }

  Future registerWithEmailAndPasswordButton() async{
    if(_formKey.currentState.validate()){
      setState(() => loading = true);
      dynamic result = await _auth.registerWithEmailAndPassword(email, password);
      if(result == null) {
        setState(() {
          loading = false;
          error = 'Please supply a valid email';
        });
      }
    }
  }
}