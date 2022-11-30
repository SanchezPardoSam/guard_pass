import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guard_pass/domain/blocs/item/item_bloc.dart';
import 'package:guard_pass/ui/pages/Inicio/widgets/item.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemBloc, ItemState>(
      builder: (context, state) {
        return Center(
          child: Column(
            children: [
              Image.asset(
                'assets/logos/Logo-secundary.png',
                width: 300,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.listItem.length,
                  itemBuilder: ((context, index) {
                    return ItemEmail(
                      item: state.listItem[index],
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
