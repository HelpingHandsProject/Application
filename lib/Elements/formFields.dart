import 'package:flutter/material.dart';
import 'package:helping_hands/Constants/colors.dart';

class NameTextField extends TextFormField {
  static RegExp notJustWhitespaces = RegExp('\\s+');

  NameTextField(String hintText, Function(String) onChanged)
      : super(
            decoration: textInputDecoration.copyWith(hintText: hintText),
            validator: nameValidator,
            onChanged: onChanged);

  static String nameValidator(String pass) {
    if (pass.length == 0) {
      return 'Enter a name';
    }
    if (pass.split(notJustWhitespaces).length == 0) {
      return 'Enter a valid name';
    }
    return null;
  }
}

class PasswordTextField extends TextFormField {
  static RegExp letter = RegExp(
    r".*[a-zA-Z].*",
  );
  static RegExp number = RegExp(
    r".*\d.*",
  );
  static RegExp special = RegExp(
    r".*\W.*",
  );

  PasswordTextField(Function(String) onChanged)
      : super(
            decoration: textInputDecoration.copyWith(hintText: 'password'),
            obscureText: true,
            validator: passwordValidator,
            keyboardType: TextInputType.multiline,
            onChanged: onChanged);

  static String passwordValidator(String pass) {
    if (pass.length <= 8) {
      return 'Enter a password at least 8 chars long';
    }
    if (!letter.hasMatch(pass)) {
      return 'Enter a password with at one letter';
    }
    if (!number.hasMatch(pass)) {
      return 'Enter a password with at one number';
    }
    if (!special.hasMatch(pass)) {
      return 'Enter a password with at one special symbol';
    }
    return null;
  }
}

class EmailTextField extends TextFormField {
  static RegExp email = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+");

  EmailTextField(Function(String) onChanged)
      : super(
            decoration: textInputDecoration.copyWith(hintText: 'email'),
            keyboardType: TextInputType.emailAddress,
            validator: emailValidator,
            onChanged: onChanged);

  static String emailValidator(String pass) {
    if (!email.hasMatch(pass)) {
      return 'Enter a valid E-Mail';
    }
    return null;
  }
}
