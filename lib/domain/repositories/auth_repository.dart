abstract class AuthRepository {
  Future<String> authentication(
      {required String user, required String password});
  newUser(
      {required String email, required String user, required String password});
  String encodeMD5({required String password});

  String encodeSha256({required String password});

  String encodeSha512({required String password});
}
