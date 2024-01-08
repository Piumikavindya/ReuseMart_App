import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:reusemart_app/screens/cart.dart';
import 'package:reusemart_app/screens/categories.dart';
import 'package:reusemart_app/screens/home_screen.dart';
import 'package:reusemart_app/screens/user.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  final List _pages = [
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const UserScreen()
  ];

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index; // this is why use stateful widget
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //method to allow user to switch between tabs
      body: _pages[_selectedIndex], //setect page should be dynamic
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _selectedPage, // navigate to the selected page
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.buy),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(IconlyLight.user2),
            label: "User",
          )
        ],
      ),
    );
  }
}
