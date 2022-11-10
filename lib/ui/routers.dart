import 'package:flutter/material.dart';
import 'package:guard_pass/ui/pages/Inicio/inicio.dart';
import 'package:guard_pass/ui/pages/Perfil/perfil.dart';

class Routers extends StatefulWidget {
  final int index;
  const Routers({super.key, required this.index});

  @override
  State<Routers> createState() => _RoutersState();
}

class _RoutersState extends State<Routers> {
  @override
  Widget build(BuildContext context) {
    List<Widget> pagesOptions = [
      const Inicio(),
      const Perfil(),
    ];
    return pagesOptions[widget.index];
  }
}
