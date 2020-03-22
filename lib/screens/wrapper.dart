import 'package:firebase_auth/firebase_auth.dart';
import 'package:helping_hands/screens/authenticate/authenticate.dart';
import 'package:helping_hands/screens/authenticate/verify_email.dart';
import 'package:helping_hands/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    // Return either the Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      if (user.isEmailVerified) {
        return Home();
      } else
        return VerifyEmail(
          user: user,
        );
    }
  }
}
