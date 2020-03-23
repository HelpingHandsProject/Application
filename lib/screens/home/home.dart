import 'package:helping_hands/Constants/colors.dart';
import 'package:helping_hands/Constants/icons.dart';
import 'package:helping_hands/Elements/logoutAppBar.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home - Feed',
      style: optionStyle,
    ),
    Text(
      'Index 1: My Requests',
      style: optionStyle,
    ),
    Text(
      'Index 2: Settings',
      style: optionStyle,
    ),
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
        appBar: LogoutAppBar(titleText: 'Helping Hands'),
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
