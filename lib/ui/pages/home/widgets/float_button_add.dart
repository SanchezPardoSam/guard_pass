import 'package:flutter/material.dart';
import 'package:guard_pass/ui/pages/home/widgets/add_item_modal.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class FloatButtonAdd extends StatefulWidget {
  const FloatButtonAdd({super.key});

  @override
  State<FloatButtonAdd> createState() => _FloatButtonAddState();
}

class _FloatButtonAddState extends State<FloatButtonAdd> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      onPressed: () {
        showCupertinoModalBottomSheet(
          context: context,
          builder: (context) => const AddItem(),
        );
      },
      child: const Icon(
        Icons.add,
        color: Color(0xFFA5A3A3),
        size: 50,
      ),
    );
  }
}