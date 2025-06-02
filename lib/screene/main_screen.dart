
import 'package:flutter/material.dart';
import 'package:project1/screene/account_screen.dart';
import 'package:project1/screene/cart_screen.dart';
import 'package:project1/screene/favorite_screen.dart';
import 'package:project1/screene/home_screen.dart';


class MainScreen extends StatefulWidget {

  
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  List<Widget> _screens = [
    HomeScreen(),
    FavoriteScreen(),
    CartScreen(),
    AccountScreen(username: "Sophannara"),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body,
      bottomNavigationBar: _bottomNavBar,
    );
  }

  Widget get _body {
    return _screens[_selectedIndex];
  }

  Widget get _bottomNavBar {

    final bottonNavBarItems = [
      BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.red,), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.favorite, color: Colors.red), label: "Favorite"),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_cart, color: Colors.red), label: "Cart"),
      BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.red), label: "Account"),
    ];

    return BottomNavigationBar(
      elevation: 2.5,
      items: bottonNavBarItems,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    );
  }
}