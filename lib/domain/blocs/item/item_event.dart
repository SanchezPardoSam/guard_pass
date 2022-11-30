part of 'item_bloc.dart';

@immutable
abstract class ItemEvent {
  final ItemState listItem = ItemState([]);
  
}

class ListItem extends ItemEvent {}

class AddedItem extends ItemEvent {
  final Item i;

  AddedItem(this.i);
}

class EditItem extends ItemEvent {}
