import 'package:flutter/material.dart';
import 'package:guard_pass/ui/pages/Inicio/widgets/item.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/logos/Logo-secundary.png',
            width: 300,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: ((context, index) {
                return const ItemEmail();
              }),
            ),
          ),
        ],
      ),
    );
  }
}
