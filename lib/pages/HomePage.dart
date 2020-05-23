import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:employement_app/pages/Offers.dart';
import 'package:employement_app/pages/Profile.dart';
import 'package:employement_app/pages/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  int _currentPage = 2;
  PageController _pageController = new PageController();

  List<Widget> _pages = [MainView(), Offers(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            children: _pages,
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          currentIndex: _currentPage,
          onItemSelected: (index) => setState(() {
            _currentPage = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          }),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.apps),
              title: Text('Home'),
              activeColor: Colors.red,
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.message),
                title: Text('Ofertas'),
                activeColor: Colors.pink),
            BottomNavyBarItem(
                icon: Icon(Icons.people),
                title: Text('Perfil'),
                activeColor: Colors.purpleAccent),
          ],
        ));
  }
}
