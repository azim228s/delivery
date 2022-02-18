import 'package:delivery/screens/analitics_screen/analitics_screen.dart';
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
    HomeScreen(),
    DeliveryScreen(),
    AnaliticsScreen(),
  ]; // to store nested tabs
  Widget currentScreen = Scaffold();
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
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        //New
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  if (_selectedIndex == 0)
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 6,
                      offset: Offset(0, 5), // changes position of shadow
                    ),
                ],
              ),
              child: Icon(Icons.home),
              // child: SvgPicture.asset("assets/icons/home_ic.svg")),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  if (_selectedIndex == 1)
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 6,
                      offset: Offset(0, 5), // changes position of shadow
                    ),
                ],
              ),
              child: Icon(Icons.list_alt),
              // child: SvgPicture.asset("assets/icons/home_ic.svg")),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  if (_selectedIndex == 2)
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 6,
                      offset: Offset(0, 5), // changes position of shadow
                    ),
                ],
              ),
              child: Icon(Icons.stacked_bar_chart),
              // child: SvgPicture.asset("assets/icons/sell_ic.svg")),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
