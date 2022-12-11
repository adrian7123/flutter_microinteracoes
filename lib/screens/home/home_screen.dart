import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_microinteracoes/screens/home/tabs/double_tap_tab.dart';
import 'package:flutter_microinteracoes/screens/home/tabs/long_press_tab.dart';
import 'package:flutter_microinteracoes/screens/home/tabs/pan_tab.dart';
import 'package:flutter_microinteracoes/screens/home/tabs/pinch_tab.dart';
import 'package:flutter_microinteracoes/screens/home/tabs/pressible_tab.dart';
import 'package:flutter_microinteracoes/screens/home/tabs/rotation_tab.dart';
import 'package:flutter_microinteracoes/theme/my_theme.dart';

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
    RotationTab(),
    PinchTab(),
    PanTab(),
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
        unselectedItemColor: MyTheme.foreground,
        selectedItemColor: MyTheme.background,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.screen_rotation_alt_outlined),
            label: 'Rotation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pinch),
            label: 'Pinch',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pan_tool_alt),
            label: 'Pan',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
