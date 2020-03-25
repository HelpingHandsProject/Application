import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helping_hands/Constants/colors.dart';

class NameTextField extends TextFormField {
  static RegExp notJustWhitespaces = new RegExp('\\s+');

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

class RequestTitleTextField extends TextFormField {
  static RegExp notJustWhitespaces = new RegExp('\\s+');

  RequestTitleTextField(String hintText, Function(String) onChanged)
      : super(
            inputFormatters: [
              new LengthLimitingTextInputFormatter(20),
            ],
            decoration: textInputDecoration.copyWith(hintText: hintText),
            validator: nameValidator,
            onChanged: onChanged);

  static String nameValidator(String pass) {
    if (pass.length == 0) {
      return 'Enter a title';
    }
    if (pass.split(notJustWhitespaces).length == 0) {
      return 'Enter a valid title';
    }
    return null;
  }
}

class RequestMessageTextField extends StatelessWidget {
  static RegExp notJustWhitespaces = new RegExp('\\s+');

  RequestMessageTextField(this.hintText, this.onChanged);

  final String hintText;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 300.0,
        ),
        child: new Scrollbar(
          child: new SingleChildScrollView(
            scrollDirection: Axis.vertical,
            reverse: true,
            child: new TextFormField(
              onChanged: onChanged,
              inputFormatters: [
                new LengthLimitingTextInputFormatter(1000),
              ],
              keyboardType: TextInputType.multiline,
              decoration: textInputDecoration.copyWith(hintText: hintText),
              validator: nameValidator,
              maxLines: null,
            ),
          ),
        ),
      ),
    );
  }

  static String nameValidator(String pass) {
    if (pass.length == 0) {
      return 'Enter a message';
    }
    if (pass.split(notJustWhitespaces).length == 0) {
      return 'Enter a valid message';
    }
    return null;
  }
}

class PasswordTextField extends TextFormField {
  static RegExp letter = new RegExp(
    r".*[a-zA-Z].*",
  );
  static RegExp number = new RegExp(
    r".*\d.*",
  );
  static RegExp special = new RegExp(
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
  static RegExp email = new RegExp(
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
