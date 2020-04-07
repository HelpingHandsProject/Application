import 'package:firebase_auth/firebase_auth.dart';
import 'package:helping_hands/models/user.dart';
import 'package:helping_hands/screens/wrapper.dart';
import 'package:helping_hands/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:helping_hands/services/user_stream.dart';
import 'package:provider/provider.dart';

void main() => runApp(Duapp());

class Duapp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DuappState();
}

class DuappState extends State<Duapp> {
  // This widget is the root of your application.
  UserStream userStream;

  @override
  void initState() {
    super.initState();
    //authenticationStreamSubscription = setUserProfileStream();
    userStream = UserStream();
  }

  @override
  void dispose() {
    super.dispose();
    userStream.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<FirebaseUser>.value(value: AuthService().firebaseUser),
        StreamProvider<User>.value(value: userStream.userStream)
      ],
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
