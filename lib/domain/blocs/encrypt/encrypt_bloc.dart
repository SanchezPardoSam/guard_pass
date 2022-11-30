import 'package:bloc/bloc.dart';
import 'package:guard_pass/data/repositories/auth_repository_impl.dart';
import 'package:guard_pass/domain/entities/item.dart';
import 'package:meta/meta.dart';

part 'encrypt_event.dart';
part 'encrypt_state.dart';

class EncryptBloc extends Bloc<EncryptEvent, EncryptState> {
  EncryptBloc() : super(EncryptState()) {
    // ignore: void_checks
    on<EncryptEvent>((event, emit) {
      if (event is EncryptPass) {
        String pass = generate(event.i);
        pass = pass.substring(0, 4) + pass.substring(pass.length-4,pass.length);
        emit(state.withCopy(
            email: event.i.email,
            logo: event.i.logo,
            typeHash: event.i.typeHash,
            passwordHash: pass,
            length: event.i.length,
            reference: event.i.reference));
      }
    });
  }
  String generate(Item i) {
    /*
     * referencia
  * longitud
  * tipo
  * correo
  * red social
  * {n+t[1]}referencia{n+r[1]}*/

    String pass = i.email.substring(0, 2) +
        i.typeHash.substring(0, 2) +
        i.reference.substring(0, 2) +
        i.email.substring(0, 2) +
        i.reference.substring(i.reference.length - 2, i.reference.length) +
        i.logo.substring(0, 2);
    // ignore: avoid_print
    print(pass);
    if (i.typeHash == 'MD5') {
      // ignore: avoid_print
      print('succes');
      return (AuthRepositoryImpl().encodeMD5(password: pass));
    }
    // ignore: avoid_print
    print('error');
    return '';
  }
}
