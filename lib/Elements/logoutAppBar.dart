import 'package:flutter/material.dart';
import 'package:helping_hands/Elements/baseAppBar.dart';
import 'package:helping_hands/services/auth.dart';

class LogoutAppBar extends BaseAppBar{

  LogoutAppBar({Key key,
    @required titleText,}): super(
    key: key,
    titleText: titleText,
      icon: Icons.exit_to_app,
      buttonText: 'logout',
    onPressedFunction: signOutWrapper,
  );

  static Function signOutWrapper(){
    final AuthService _auth = AuthService();
    _auth.signOut();
  }
}