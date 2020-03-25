import 'package:firebase_auth/firebase_auth.dart';
import 'package:helping_hands/models/user.dart';
import 'package:helping_hands/screens/authenticate/authenticate.dart';
import 'package:helping_hands/screens/authenticate/verify_email.dart';
import 'package:helping_hands/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:helping_hands/services/crud.dart';
import 'package:helping_hands/shared/loading.dart';
import 'package:provider/provider.dart';

import 'authenticate/createProfile.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: CRUD.getUserProfile(),
        builder: (context, AsyncSnapshot<User> snapshot) {
          if (snapshot.hasData) {
            final firebaseUser = Provider.of<FirebaseUser>(context);
            User user = snapshot.data;
            bool profileIsComplete = user.isComplete();

            // Return either the Home or Authenticate widget
            if (firebaseUser == null) {
              return Authenticate();
            } else {
              if (firebaseUser.isEmailVerified) {
                if (profileIsComplete) {
                  return Home();
                } else {
                  return CreateProfile();
                }
              } else
                return VerifyEmail(
                  user: firebaseUser,
                );
            }
          } else if (snapshot.hasError) {
            print("Error: " + snapshot.error.toString());
            print("Wrapper/Build: Error, but showing profile creation");
            return CreateProfile();
          } else {
            return Loading();
          }
        });
  }
}
