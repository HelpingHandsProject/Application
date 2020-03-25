import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helping_hands/Constants/colors.dart';
import 'package:helping_hands/Constants/icons.dart';
import 'package:helping_hands/Elements/logoutAppBar.dart';
import 'package:helping_hands/elements/formFields.dart';
import 'package:helping_hands/models/user.dart';
import 'package:helping_hands/services/auth.dart';
import 'package:helping_hands/services/crud.dart';
import 'package:image_picker/image_picker.dart';

class CreateProfile extends StatefulWidget {
  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  File _image;
  static AssetImage defaultImage =
      AssetImage('assets/images/profile-picture.png');
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
        appBar: LogoutAppBar(titleText: 'Create Profile'),
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
                      Container(
                          width: 190.0,
                          height: 190.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
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
                      Text(firstName + " " + lastName, textScaleFactor: 1.5)
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
                      'Complete Profile',
                      style: TextStyle(color: lightTextColor),
                    ),
                    onPressed: () => completingProfileInformation,
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
        ));
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

  Future completingProfileInformation() async {
    if (_formKey.currentState.validate()) {
      setState(() => loading = true);
      String uid = await AuthService.getUserId();
      String deviceId = await AuthService.getDeviceId();
      List<String> deviceIds =
          deviceId != null ? [deviceId] : [] as List<String>;
      User user = User(uid, deviceIds, firstName, lastName, [], [], 0, 0);
      DocumentReference result = await CRUD.add<User>(user);
      if (result == null) {
        setState(() {
          loading = false;
          error = "We could not complete your profile";
        });
      }
    }
  }
}
