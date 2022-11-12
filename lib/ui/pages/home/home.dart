import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guard_pass/ui/pages/home/widgets/float_button_add.dart';
import 'package:guard_pass/ui/routers.dart';
import 'package:guard_pass/ui/widgets/bottom_bar.dart';

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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
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
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black54,
                blurRadius: 15.0,
                offset: Offset(0.0, 0.75))
          ],
        ),
        child: _bottomBar,
      ),
      floatingActionButton: Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black54,
                blurRadius: 20.0,
                offset: Offset(0.0, 0.55)
            )
          ],
        ),
        child: const FloatButtonAdd(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
