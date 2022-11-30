part of 'encrypt_bloc.dart';

class EncryptState extends Item {
  EncryptState({
    super.logo = '',
    super.email = 'sanchezpardosam@gmail.com',
    super.typeHash = '',
    super.passwordHash = '',
    super.reference = '',
    super.length = '',
  });

  EncryptState withCopy({
    String? email,
    String? logo,
    String? typeHash,
    String? passwordHash,
    String? length,
    String? reference,
  }) =>
      EncryptState(
        email: email ?? this.email,
        logo: logo ?? this.logo,
        typeHash: typeHash ?? this.typeHash,
        passwordHash: passwordHash ?? this.passwordHash,
        length: length ?? this.length,
        reference: reference ?? this.reference,
      );
}
