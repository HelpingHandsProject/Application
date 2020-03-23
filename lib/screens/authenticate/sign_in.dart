import 'package:helping_hands/Constants/colors.dart';
import 'package:helping_hands/Constants/icons.dart';
import 'package:helping_hands/Elements/baseAppBar.dart';
import 'package:helping_hands/Elements/formFields.dart';
import 'package:helping_hands/services/auth.dart';
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

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: backgroundColor,
      appBar: BaseAppBar(titleText: 'Sign in', icon: personIcon,
        buttonText: "Register", onPressedFunction: widget.toggleView),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                EmailTextField((val) {setState(() => email = val);}),
                SizedBox(height: 20.0),
                TextFormField(
                  obscureText: true,
                  decoration: textInputDecoration.copyWith(hintText: 'password'),
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                ForgotPW(email: email, auth: _auth,),
                RaisedButton(
                  color: primaryColor,
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: lightTextColor),
                  ),
                  onPressed: signInWithEmailAndPasswordButton
                ),
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
                  style: TextStyle(color: errorColor, fontSize: 14.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future signInWithEmailAndPasswordButton() async {
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
}

class ForgotPW extends StatelessWidget {

  final AuthService auth;
  final String email;
  const ForgotPW({
    Key key, this.email, this.auth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Future forgotPasswordWrapper() async {
      await forgotPassword(context);
    }

    return FlatButton(
      child: Text("Forgot Password?"),
      textColor: darkTextColor,
      onPressed: forgotPasswordWrapper,
    );
  }

  Future forgotPassword(context) async {
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
  }
}