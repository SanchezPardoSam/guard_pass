// ignore_for_file: depend_on_referenced_packages

import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:guard_pass/data/repositories/auth_repository_impl.dart';
import 'package:guard_pass/domain/entities/item.dart';
import 'package:guard_pass/domain/entities/item.dart';
import 'package:meta/meta.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc() : super(ItemState([])) {
    // ignore: void_checks
    on<ItemEvent>((event, emit) {
      if (event is AddedItem) {
        state.listItem.add(Item(
          email: event.i.email,
          logo: event.i.logo,
          typeHash: event.i.typeHash,
          passwordHash: event.i.passwordHash,
          reference: event.i.reference,
          length: event.i.length,
        ));
        print(state.listItem.length);
        emit(state);
      }
    });
  }
}
