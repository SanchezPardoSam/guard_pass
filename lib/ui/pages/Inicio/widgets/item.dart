import 'package:flutter/material.dart';
import 'package:guard_pass/domain/entities/item.dart';
import 'package:guard_pass/ui/pages/home/widgets/add_item_modal.dart';
import 'package:ionicons/ionicons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';



class ItemEmail extends StatefulWidget {
  final Item item;
  const ItemEmail({super.key, required this.item});

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
          Text(widget.item.email),
          MaterialButton(
            onPressed: () {
              showCupertinoModalBottomSheet(
          context: context,
          builder: (context) =>  AddItem(),
        );
            },
            child: const Icon(
              Ionicons.ellipsis_vertical_sharp,
            ),
          ),
        ],
      ),
    );
  }
}
