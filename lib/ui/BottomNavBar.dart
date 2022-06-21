import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: const [
      BottomNavigationBarItem(icon:
        Icon(Icons.home),
        label: ''
      ),
      BottomNavigationBarItem(icon:
      Icon(Icons.favorite),
          label: ''
      ),
      BottomNavigationBarItem(icon:
      Icon(Icons.notifications),
          label: ''
      ),
    ]);
  }
}
