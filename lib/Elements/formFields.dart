import 'package:flutter/material.dart';
import 'package:helping_hands/Constants/colors.dart';

class PasswordTextField extends TextFormField{

  static RegExp letter = new RegExp(r".*[a-zA-Z].*",);
  static RegExp number = new RegExp(r".*\d.*",);
  static RegExp special = new RegExp(r".*\W.*",);

  PasswordTextField(Function(String) onChanged) : super(
      decoration: textInputDecoration.copyWith(hintText: 'password'),
      obscureText: true,
      validator: passwordValidator,
      onChanged: onChanged);

  static String passwordValidator(String pass){

    if(pass.length <= 8){
      return 'Enter a password at least 8 chars long';
    }
    if(!letter.hasMatch(pass)){
      return 'Enter a password with at one letter';
    }
    if(!number.hasMatch(pass)){
      return 'Enter a password with at one number';
    }
    if(!special.hasMatch(pass)){
      return 'Enter a password with at one special symbol';
    }
      return null;
  }
}

  class EmailTextField extends TextFormField{

    static RegExp email = new RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+");

    EmailTextField(Function(String) onChanged) : super(
    decoration: textInputDecoration.copyWith(hintText: 'email'),
    validator: emailValidator,
    onChanged: onChanged);

  static String emailValidator(String pass){

  if(!email.hasMatch(pass)){
  return 'Enter a valid E-Mail';
  }
  return null;
  }
}
