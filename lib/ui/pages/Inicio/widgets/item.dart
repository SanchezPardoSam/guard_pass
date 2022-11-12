import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ItemEmail extends StatefulWidget {
  const ItemEmail({super.key});

  @override
  State<ItemEmail> createState() => _ItemEmailState();
}

class _ItemEmailState extends State<ItemEmail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: const EdgeInsets.all(
        10,
      ),
      padding: const EdgeInsets.only(
        left: 10,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black54,
              blurRadius: 20.0,
              offset: Offset(0.0, 0.55))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Ionicons.logo_facebook),
          const Text('email@example.com'),
          MaterialButton(
            onPressed: () {},
            child: const Icon(
              Ionicons.ellipsis_vertical_sharp,
            ),
          ),
        ],
      ),
    );
  }
}
