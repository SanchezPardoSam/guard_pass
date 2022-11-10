import 'package:flutter/material.dart';
import 'package:guard_pass/ui/routers.dart';
import 'package:guard_pass/ui/widgets/bottomBar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  BottomBar? _bottomBar;
  int _selectedIndex = 0;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _bottomBar = BottomBar(currentIndex: (i) {
      setState(() {
        _selectedIndex = i;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Routers(
        index: _selectedIndex,
      ),
      bottomNavigationBar: _bottomBar,
    );
  }
}
