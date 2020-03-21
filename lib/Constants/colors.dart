import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Basic Colors
final Color primaryColor = Colors.green[600];
final Color backgroundColor = Colors.brown[50];
final Color errorColor = Colors.red;

// Text colors
final Color darkTextColor = Colors.black54;
final Color lightTextColor = Colors.white;

// Symbol Colors
final Color unselectedItemColor = Colors.grey[600];
final Color loadingSymbolColor = Colors.brown;

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