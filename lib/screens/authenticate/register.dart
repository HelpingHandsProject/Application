import 'package:helping_hands/services/auth.dart';
import 'package:helping_hands/shared/constants.dart';
import 'package:helping_hands/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

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

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      //ParametrizedAppBar(performAction: widget.toggleView(), displayText: 'Sign up for Helping Hands', displayIcon: Icons.person, buttonLabel: 'Sign In', appBar: AppBar()),
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        elevation: 0.0,
        title: Text('Sign up for Helping Hands'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            onPressed: () => widget.toggleView(),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'email'),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'password'),
                obscureText: true,
                validator: (val) => val.length < 8 ? 'Enter a password 8+ chars long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.green[600],
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
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
              ),
              SizedBox(height: 6.0),
              /*GoogleSignInButton(onPressed: () async {
                setState(() => loading = true);
                dynamic result = await _auth.googleSignIn();
                if(result == null) {
                  setState(() {
                    loading = false;
                    error = 'Could not sign in with google';
                  });
                }
              }),
              RaisedButton(
                  color: Colors.white,
                  child: Text(
                    'Register with Google',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () async {
                    setState(() => loading = true);
                    dynamic result = await _auth.googleSignIn();
                    if(result == null) {
                      setState(() {
                        loading = false;
                        error = 'Could not register you with google';
                      });
                    }

                  }
              ),*/
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}