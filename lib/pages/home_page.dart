import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;
  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          _currentIndex = index;

          widget.navigationShell.goBranch(_currentIndex,
              initialLocation:
                  _currentIndex == widget.navigationShell.currentIndex);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.animation),
            label: 'Object',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pages),
            label: 'Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.vertical_align_bottom_outlined),
            label: 'Button',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
