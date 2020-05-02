import 'package:employement_app/pages/Offers.dart';
import 'package:employement_app/pages/Profile.dart';
import 'package:flutter/material.dart';

import 'MainView.dart';
import 'Offers.dart';
import 'Profile.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomePage> {
  int _currentPage = 1;

  List<Widget> _pages = [Offers(), MainView(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          _bottomIcons(Icons.book),
          _bottomIcons(Icons.home),
          _bottomIcons(Icons.person),
        ],
        onTap: _changePage,
        currentIndex: _currentPage,
      ),
    );
  }

  void _changePage(int index) {
    setState(() {
      _currentPage = index;
    });
  }
}

BottomNavigationBarItem _bottomIcons(IconData icon) {
  return BottomNavigationBarItem(icon: Icon(icon), title: Text(""));
}
