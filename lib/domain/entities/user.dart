import 'package:guard_pass/domain/entities/item.dart';

class User {
  final String _user;
  final String _password;
  final String _token;
  final List<Item> _listItem;

  User(this._user, this._password, this._token, this._listItem);

  get user => _user;
  get password => _password;
  get token => _token;
  get listItem => _listItem;
}
