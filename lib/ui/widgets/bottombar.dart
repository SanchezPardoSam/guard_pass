import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class BottomBar extends StatefulWidget {
  final Function currentIndex;
  const BottomBar({super.key, required this.currentIndex});
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      widget.currentIndex(_selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Ionicons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Ionicons.people),
          label: 'Perfil',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      iconSize: 25,
      selectedFontSize: 14,
      unselectedFontSize: 12,
    );
  }
}
