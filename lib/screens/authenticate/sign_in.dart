import 'package:helping_hands/services/auth.dart';
import 'package:helping_hands/shared/constants.dart';
import 'package:helping_hands/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

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
      appBar: AppBar(
        backgroundColor: Colors.green[600],
        elevation: 0.0,
        title: Text('Sign in to Helping Hands'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
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
                obscureText: true,
                decoration: textInputDecoration.copyWith(hintText: 'password'),
                validator: (val) => val.length < 8 ? 'Enter a password 8+ chars long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              ForgotPW(email: email, auth: _auth,),
              //SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.green[600],
                child: Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    setState(() => loading = true);
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                    if(result == null) {
                      setState(() {
                        loading = false;
                        error = 'Could not sign in with those credentials';
                      });
                    }
                  }
                }
              ),
              //SizedBox(height: 6.0),
              GoogleSignInButton(onPressed: () async {
                dynamic result = await _auth.googleSignIn();
                if(result == null) {
                  setState(() {
                    loading = false;
                    error = 'Could not sign in with google';
                  });
                }
              }),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPW extends StatelessWidget {

  final AuthService auth;
  final String email;
  const ForgotPW({
    Key key, this.email, this.auth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text("Forgot Password?"),
      textColor: Colors.black54,
      onPressed: () async {
        String msg = '!';
        if(email.contains('@') && email.contains('.')){
          dynamic result = await auth.sendPasswordResetEmail(email);
          if(result != null)
            msg = 'df!';
          else
            msg = 'If you are registered, we sent you a password-reset E-Mail!';
        }
        else {
          msg = 'Enter a valid E-Mail!';
        }
        final snackBar = SnackBar(
          content: Text(msg),
        );
        // Find the Scaffold in the widget tree and use
        // it to show a SnackBar.
        Scaffold.of(context).showSnackBar(snackBar);
        },
    );
  }
}