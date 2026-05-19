import 'package:flutter/material.dart';
import 'package:home_work/screens/y3s2/notification_screen.dart';
import 'package:home_work/screens/y3s2/profile_screen.dart';
import 'package:home_work/screens/y3s2/home_screen.dart';
import 'package:home_work/screens/y3s2/favorite_screeen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<MainScreen> {
  int _indexSelectedItems = 0;

  List<Widget> screensList = [
    HomeScreen(),
    FavoriteScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];

  void _onTabChange(int index) {
    setState(() {
      _indexSelectedItems = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomNavBarItems = [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "Home",
        backgroundColor: Colors.teal[700],
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        label: "Favorite",
        backgroundColor: Colors.teal[700],
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.notifications),
        label: "Notification",
        backgroundColor: Colors.teal[700],
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        label: "Profile",
        backgroundColor: Colors.teal[700],
      ),
    ];

    final bottomNavBar = BottomNavigationBar(
      selectedItemColor: Colors.teal[100],
      unselectedItemColor: Colors.teal[300],
      backgroundColor: Colors.teal[700],
      items: bottomNavBarItems,
      currentIndex: _indexSelectedItems,
      onTap: _onTabChange,
    );

    return Scaffold(
      body: screensList.elementAt(_indexSelectedItems),
      bottomNavigationBar: bottomNavBar,
    );
  }
}
