import 'dart:io';

import 'package:clipboard/clipboard.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guard_pass/domain/blocs/encrypt/encrypt_bloc.dart';
import 'package:guard_pass/domain/blocs/item/item_bloc.dart';
import 'package:guard_pass/domain/entities/item.dart';
import 'package:ionicons/ionicons.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final formKey = GlobalKey<FormState>();
  TextEditingController passEncrypt = TextEditingController();
  String referencia = '';
  String pass = '';
  String email = '';

  String encrypt = "MD5";
  final List<String> itemsEncrypt = ['MD5', 'SHA256', 'SHA512'];

  String length = "8";
  final List<String> itemsLength = ['8', '12', '16'];

  String social = "Google";
  final List<String> itemsSocial = ['Google', 'Facebook', 'Twitter'];

  @override
  Widget build(BuildContext context) {
    final providerItem = BlocProvider.of<ItemBloc>(context);
    final providerEncrypt = BlocProvider.of<EncryptBloc>(context);

    return BlocBuilder<EncryptBloc, EncryptState>(
      builder: (context, state) {
        return Material(
          child: Container(
            margin: const EdgeInsets.all(15),
            height: 500,
            child: Center(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Nueva contraseña',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: const Text("Seleccione Encrypy"),
                        value: encrypt,
                        onChanged: (newValue) {
                          setState(() {
                            encrypt = newValue!;
                          });
                        },
                        items:
                            itemsEncrypt.map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    TextFormField(
                      textAlign: TextAlign.start,
                      decoration: const InputDecoration(
                        hintText: 'Referencia',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              12.0,
                            ),
                          ),
                        ),
                      ),
                      onSaved: (String? value) => referencia = value!,
                      validator: (String? value) =>
                          value == '' ? 'Ingrese referencia' : null,
                    ),
                    TextFormField(
                      textAlign: TextAlign.start,
                      decoration: const InputDecoration(
                        hintText: 'Correo',
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              12.0,
                            ),
                          ),
                        ),
                      ),
                      onSaved: (String? value) => email = value!,
                      validator: (String? value) =>
                          value == '' ? 'Ingrese email' : null,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                10,
                              ),
                            ),
                          ),
                          child: DropdownButton<String>(
                            disabledHint: const Text("Seleccione longitud"),
                            hint: const Text("Seleccione longitud"),
                            value: length,
                            onChanged: (newValue) {
                              setState(() {
                                length = newValue!;
                              });
                            },
                            items: itemsLength
                                .map<DropdownMenuItem<String>>((value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                10,
                              ),
                            ),
                          ),
                          child: DropdownButton<String>(
                            hint: const Text("Seleccione red social"),
                            value: social,
                            onChanged: (newValue) {
                              setState(() {
                                social = newValue!;
                              });
                            },
                            items: itemsSocial
                                .map<DropdownMenuItem<String>>((value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      readOnly: true,
                      controller: passEncrypt,
                      decoration: InputDecoration(
                        suffixIcon: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                                left: BorderSide(
                              color: Colors.black,
                            )),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Ionicons.copy_outline,
                            ),
                            onPressed: () {
                              FlutterClipboard.copy(passEncrypt.text)
                                  .then((value) => print('Copied'));
                            },
                          ),
                        ),
                        hintText: 'Password Generate',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              12.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            generarPass(providerEncrypt);

                            setState(() {
                              passEncrypt.text = state.passwordHash;
                            });
                          },
                          child: const Text(
                            'Generar',
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => {
                            providerItem.add(
                              AddedItem(
                                Item(
                                  email: email,
                                  logo: social,
                                  passwordHash: '',
                                  reference: referencia,
                                  typeHash: encrypt,
                                  length: length,
                                ),
                              ),
                            ),
                            Navigator.of(context).pop(),
                          },
                          child: const Text(
                            'Guardar',
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.red,
                            ),
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text(
                            'Cerrar',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void generarPass(EncryptBloc provider) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      provider.add(
        EncryptPass(
          Item(
            email: email,
            logo: social,
            passwordHash: '',
            reference: referencia,
            typeHash: encrypt,
            length: length,
          ),
        ),
      );
    }
  }
}
