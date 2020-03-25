import 'package:helping_hands/constants/colors.dart';
import 'package:helping_hands/constants/icons.dart';
import 'package:flutter/material.dart';
import 'package:helping_hands/screens/home/myRequests.dart';
import 'package:helping_hands/screens/home/profileSettings.dart';

import 'feed.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Feed(),
    MyRequests(),
    ProfileSettings()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(homeIcon),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(addRequestIcon),
              title: Text('My Requests'),
            ),
            BottomNavigationBarItem(
              icon: Icon(settingsIcon),
              title: Text('Settings'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: primaryColor,
          unselectedItemColor: unselectedItemColor,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
