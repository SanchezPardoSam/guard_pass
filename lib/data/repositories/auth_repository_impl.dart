import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:guard_pass/domain/repositories/auth_repository.dart';

// ignore: slash_for_doc_comments
/**
 * referencia
 * longitud
 * tipo
 * correo
 * red social
 * 
 *  {n+t[1]}referencia{n+r[1]}
 *  8 [32] {2/8/2/---}
 *  12 [64] {}
 *  16 [128] {}
 */
class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<String> authentication(
      {required String user, required String password}) {
    throw UnimplementedError();
  }

  @override
  String encodeMD5({required String password}) {
    final bytes = utf8.encode(password);
    final digest = md5.convert(bytes);

    return digest.toString();
  }

  @override
  String encodeSha256({required String password}) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);

    return digest.toString();
  }

  @override
  String encodeSha512({required String password}) {
    final bytes = utf8.encode(password);
    final digest = sha512.convert(bytes);

    return digest.toString();
  }

  @override
  newUser(
      {required String email, required String user, required String password}) {
    throw UnimplementedError();
  }
}
