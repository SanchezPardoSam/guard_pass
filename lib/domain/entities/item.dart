import 'package:flutter/material.dart';
import 'package:guard_pass/domain/entities/enum_Logo.dart';

class Item {
  final LogoIcons _logo;
  final String _email;
  final String _typeHash;
  final String _passwordHash;
  final String _reference;

  Item(this._logo, this._email, this._typeHash, this._passwordHash,
      this._reference);

  Icon get logo {
    return _logo.icono;
  }
  String get email {
    return _email;
  }
   String get typeHash {
    return _typeHash;
  }
   String get passwordHash {
    return _passwordHash;
  }
   String get reference {
    return _reference;
  }
}
