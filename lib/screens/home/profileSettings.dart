import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helping_hands/constants/colors.dart';
import 'package:helping_hands/constants/icons.dart';
import 'package:helping_hands/elements/formFields.dart';
import 'package:helping_hands/elements/logoutAppBar.dart';
import 'package:image_picker/image_picker.dart';

class ProfileSettings extends StatefulWidget {
  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  File _image;
  static AssetImage defaultImage =
      new AssetImage('assets/images/profile-picture.png');
  ImageProvider imageProvider = defaultImage;
  String error = '';
  String firstName = '';
  String lastName = '';

  @override
  Widget build(BuildContext context) {
    if (_image != null) {
      imageProvider = FileImage(_image);
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: LogoutAppBar(titleText: firstName + " " + lastName),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                        width: 190.0,
                        height: 190.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.cover, image: imageProvider))),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FloatingActionButton(
                          onPressed: getImageFromCamera,
                          tooltip: 'Pick Image',
                          child: Icon(openCameraIcon),
                        ),
                        SizedBox(width: 20.0),
                        FloatingActionButton(
                          onPressed: getImageFromGallery,
                          tooltip: 'Pick Image',
                          child: Icon(openGalleryIcon),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    new Text(firstName + " " + lastName, textScaleFactor: 1.5)
                  ],
                ),
                SizedBox(height: 20.0),
                NameTextField("Firstname", (val) {
                  setState(() => firstName = val);
                }),
                SizedBox(height: 20.0),
                NameTextField("Lastname", (val) {
                  setState(() => lastName = val);
                }),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: primaryColor,
                  child: Text(
                    'Update Profile',
                    style: TextStyle(color: lightTextColor),
                  ),
                  onPressed: () => {},
                ),
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

  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  Future getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

/*
  Future completingProfileInformation() async{
    if(_formKey.currentState.validate()){
      setState(() => loading = true);
      dynamic result = await callThatMethodWithAllInformation(firstName, lastName);
      if(result == null) {
        setState(() {
          loading = false;
          error = "We could not complete your profile";
        });
      }
    }
  }*/
}
