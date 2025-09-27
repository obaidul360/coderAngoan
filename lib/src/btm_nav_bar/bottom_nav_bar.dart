import 'package:coder/src/screen/account_screen.dart';
import 'package:coder/src/screen/cart_screen.dart';
import 'package:coder/src/screen/favorite_screen.dart';
import 'package:coder/src/screen/home_screen.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex=0;
  final List<Widget> _screen=[
    HomeScreenPage(),
    FavoriteScreenPage(),
    CartScreenPage(),
    AccountScreenPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,//Tap Icon and text Fixed.
        unselectedItemColor: Color(0xFFA89D9B),// unselected Tap Icons and Text
        backgroundColor: Color(0xFF703224),// BTMNAVB Background Color
        selectedItemColor: Colors.orange,//Select Tap icond and Text Color
        currentIndex: _currentIndex,//index change
          onTap: (value){
          setState(() {
            _currentIndex =value;
          });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: "Favorite"),
            BottomNavigationBarItem(icon: Icon(Icons.card_travel),label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "Account"),
          ]),
    );
  }
}
