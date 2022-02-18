import 'package:delivery/screens/analitics_screen/analytics_screen.dart';
import 'package:delivery/screens/delivery_screen/delivery_screen.dart';
import 'package:delivery/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBarScreen extends StatefulWidget {
  @override
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    const HomeScreen(),
    const DeliveryScreen(),
    const AnalyticsScreen(),
  ]; // to store nested tabs
  Widget currentScreen = const Scaffold();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        fixedColor: Colors.blueAccent,
        iconSize: 30,
        unselectedItemColor: Colors.blueAccent,
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          bottomBarItem(Icons.home, 0),
          bottomBarItem(Icons.list_alt, 1),
          bottomBarItem(Icons.stacked_bar_chart, 2),
        ],
      ),
    );
  }

  BottomNavigationBarItem bottomBarItem(IconData icon, int index){
    return BottomNavigationBarItem(
      icon: AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: _selectedIndex == index ? Colors.blueAccent : Colors.transparent,
        ),
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 300),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            icon,
            color: _selectedIndex == index ? Colors.white : Colors.blueAccent,
          ),
        ),
      ),
      label: '',
    );
  }
}
