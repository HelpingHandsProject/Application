import 'package:firebase_auth/firebase_auth.dart';
import 'package:helping_hands/models/user.dart';
import 'package:helping_hands/screens/authenticate/authenticate.dart';
import 'package:helping_hands/screens/authenticate/verify_email.dart';
import 'package:helping_hands/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:helping_hands/shared/loading.dart';
import 'package:provider/provider.dart';

import 'authenticate/createProfile.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = Provider.of<FirebaseUser>(context);
    final user = Provider.of<User>(context);
    bool profileIsComplete = user == null ? false : user.isComplete();

    // Return either the Home or Authenticate widget
    if (firebaseUser == null) {
      return Authenticate();
    } else {
      if (firebaseUser.isEmailVerified) {
        if (user != null) {
          if (profileIsComplete) {
            return Home();
          } else {
            return CreateProfile();
          }
        } else {
          // Show loading screen until Firebase sends a result
          return Loading();
        }
      } else
        return VerifyEmail(
          user: firebaseUser,
        );
    }
  }
}
