import 'package:helping_hands/Constants/colors.dart';
import 'package:helping_hands/Constants/icons.dart';
import 'package:helping_hands/Elements/baseAppBar.dart';
import 'package:helping_hands/Elements/formFields.dart';
import 'package:helping_hands/services/auth.dart';
import 'package:helping_hands/shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;
  bool hasAgreedToTermsOfUse = false;

  // Text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: backgroundColor,
            appBar: BaseAppBar(
                titleText: 'Sign up',
                icon: personIcon,
                buttonText: "Sign In",
                onPressedFunction: widget.toggleView),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      EmailTextField((val) {
                        setState(() => email = val);
                      }),
                      SizedBox(height: 20.0),
                      PasswordTextField((val) {
                        setState(() => password = val);
                      }),
                      SizedBox(height: 20.0),
                      Row(
                        children: <Widget>[
                          Checkbox(
                            value: hasAgreedToTermsOfUse,
                            checkColor: lightTextColor,
                            activeColor: primaryColor,
                            onChanged: (value) {
                              setState(() => hasAgreedToTermsOfUse = value);
                              if (value) {
                                _showBasicInfo();
                              }
                            },
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                  "I agree that my personal data will be\nprocessed"),
                            ],
                          ),
                        ],
                      ),
                      RaisedButton(
                          color: primaryColor,
                          child: Text(
                            'Privacy Policy',
                            style: TextStyle(color: lightTextColor),
                          ),
                          onPressed: _showPrivacyPolicy),
                      RaisedButton(
                          color: primaryColor,
                          child: Text(
                            'Register',
                            style: TextStyle(color: lightTextColor),
                          ),
                          onPressed: registerWithEmailAndPasswordButton),
                      SizedBox(height: 6.0),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: errorColor, fontSize: 14.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  void _showPrivacyPolicy() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Pricay Policy"),
          content: SingleChildScrollView(
              child: Text(
                  "Datenschutzinformation\n\nWir als verarbeitende Stelle im Sinne der Datenschutzgrundverordnung der EU (DSGVO) nehmen den Schutz Ihrer Privatsphäre und Ihrer personenbezogenen Daten sehr ernst. Wir freuen uns über Ihren Download unserer mobilen Applikation und Ihr damit verbundenes Interesse an unserem Produkt und möchten, dass Sie sich auch hinsichtlich des Schutzes Ihrer personenbezogenen Daten sicher fühlen. Die Nutzung unserer Applikation ist in der Regel ohne Angabe von personenbezogenen Daten möglich. Personenbezogene Daten sind nach Art. 4 Nr. 1 DSGVO alle Informationen, die sich auf eine identifizierte oder identifizierbare Person wie beispielsweise der Namen, die Anschrift und das Geburtsdatum beziehen. Auch pseudonyme Daten, die wir Ihnen nicht direkt, z.B. über einen Namen oder eine E-Mail-Adresse zuordnen können, sind personenbezogene Daten Die Erhebung, Speicherung und Verarbeitung von personenbezogenen Daten steht im Einklang mit den gesetzlichen Regelungen, insbesondere denen des Bundesdatenschutzgesetzes (BDSG), des Telemediengesetzes (TMG) und der Datenschutzgrundverordnung der EU. Wir können Ihnen zusichern, dass wir Ihre personenbezogenen Daten ausschließlich für den Zweck der funktionsfähigen Bereitstellung dieser mobilen Applikation sowie deren Inhalte und Leistungen erheben, speichern und verarbeiten. Diese Vorgänge erfolgen jeweils nur im Rahmen des berechtigten Interesses nach Art. 6 Abs. 1 S. 1 lit. f DSGVO oder wenn ein sonstiger Erlaubnistatbestand besteht. Diese Daten werden ohne Ihre ausdrückliche Zustimmung nicht an Dritte weitergegeben. Wir weisen darauf hin, dass die Datenübertragung im Internet (z.B. bei der Kommunikation per E-Mail) Sicherheitslücken aufweisen kann. Ein lückenloser Schutz der Daten vor dem Zugriff Dritte ist nicht möglich.")),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showBasicInfo() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Data we collect from you"),
          content: SingleChildScrollView(
              child: Text(
                  "We collect data from you and others in order to provide you with this service. We keep your data safe and encrypted at all times. We will handle your data with care and we will not sell it to anyone. We are very concerned not to violate your privacy. For further information check our Privacy Policy\n\nWe collect, store and process your:\n\n- E-Mail adress\n- Password\n- Chat messages\n- Firstname\n- Lastname\n- Adress\n- Ratings\n- Device information\n- Requests\n- Profile picture")),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future registerWithEmailAndPasswordButton() async {
    if (_formKey.currentState.validate()) {
      if (hasAgreedToTermsOfUse) {
        setState(() => loading = true);
        dynamic result =
            await _auth.registerWithEmailAndPassword(email, password);
        if (result == null) {
          setState(() {
            loading = false;
            error = 'Please supply a valid email';
          });
        }
      } else {
        setState(() {
          error = 'You must agree to the terms of service!';
        });
      }
    }
  }
}
