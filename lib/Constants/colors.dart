import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Basic Colors
final Color PrimaryColor = Colors.green[600];
final Color BackgroundColor = Colors.brown[50];
final Color ErrorColor = Colors.red;

// Text colors
final Color DarkTextColor = Colors.black54;
final Color LightTextColor = Colors.white;

// Symbol Colors
final Color UnselectedItemColor = Colors.grey[600];
final Color LoadingSymbolColor = Colors.brown;

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.all(12.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black54, width: 2.0),
  ),
);