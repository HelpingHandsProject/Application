import 'package:firebase_auth/firebase_auth.dart';
import 'package:helping_hands/screens/wrapper.dart';
import 'package:helping_hands/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>.value(
      value: AuthService().firebaseUser,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}