import 'package:flutter/material.dart';
import 'package:helping_hands/constants/icons.dart';
import 'package:helping_hands/elements/clickableIconAppBar.dart';
import 'package:helping_hands/services/auth.dart';

class LogoutAppBar extends ClickableIconAppBar {
  LogoutAppBar({
    Key key,
    @required titleText,
  }) : super(
          key: key,
          titleText: titleText,
          icon: logoutIcon,
          buttonText: 'logout',
          onPressedFunction: signOutWrapper,
        );

  static void signOutWrapper() {
    final AuthService _auth = AuthService();
    _auth.signOut();
  }
}
