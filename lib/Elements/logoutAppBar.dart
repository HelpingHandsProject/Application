import 'package:flutter/material.dart';
import 'package:helping_hands/Constants/icons.dart';
import 'package:helping_hands/Elements/clickableIconAppBar.dart';
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
