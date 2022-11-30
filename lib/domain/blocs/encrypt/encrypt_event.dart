part of 'encrypt_bloc.dart';

@immutable
abstract class EncryptEvent {}

class EncryptPass extends EncryptEvent {
  final Item i;

  EncryptPass(this.i);
}

