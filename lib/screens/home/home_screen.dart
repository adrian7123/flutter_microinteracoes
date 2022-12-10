import 'package:flutter/material.dart';
import 'package:flutter_microinteracoes/screens/home/tabs/double_tap_tab.dart';
import 'package:flutter_microinteracoes/screens/home/tabs/long_press_tab.dart';
import 'package:flutter_microinteracoes/screens/home/tabs/pressible_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> tabs = [
    PressableTab(),
    DoubleTapTab(),
    LongPressTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: tabs.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            // icon: Icon(Icons.account_tree_rounded),
            label: 'Pressable',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.device_hub_outlined),
            label: 'Double Tap',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_tree_rounded),
            label: 'Long Press',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
