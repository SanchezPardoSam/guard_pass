import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guard_pass/ui/pages/Login/login.dart';
import 'package:ionicons/ionicons.dart';
import 'package:path_provider/path_provider.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  Future<Directory?>? _externalDocumentsDirectory;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
  }

  void _requestAppDocumentsDirectory() {
    setState(() {
      _externalDocumentsDirectory = getExternalStorageDirectory();
    });
  }

  void createExcel(String directory) {
    final excel = Excel.createExcel();
    final sheet = excel[excel.getDefaultSheet()!];
    sheet
        .cell(
          CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0),
        )
        .value = 'Red social';
    sheet
        .cell(
          CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 0),
        )
        .value = 'Correo';
    sheet
        .cell(
          CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 0),
        )
        .value = 'Password';
    for (var i = 0; i < 10; i++) {
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: i + 1))
          .value = 'Google';
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: i + 1))
          .value = 'rieszein@gmail.com';
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: i + 1))
          .value = 'password';
    }

    final fileBytes = excel.save();

    File(("$directory/data.xlsx"))
      ..createSync(recursive: true)
      ..writeAsBytesSync(fileBytes!);
    print('export password');
  }

  Widget _buildDirectory(
      BuildContext context, AsyncSnapshot<Directory?> snapshot) {
    Text text = const Text('');
    if (snapshot.connectionState == ConnectionState.done) {
      if (snapshot.hasError) {
        text = Text('Error: ${snapshot.error}');
      } else if (snapshot.hasData) {
        text = Text('path: ${snapshot.data!.path} ');

        print(snapshot.data!.path);
        createExcel(snapshot.data!.path);
      } else {
        text = const Text('path unavailable');
      }
    }
    return Padding(padding: const EdgeInsets.all(16.0), child: text);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ClipOval(
            child: Material(
              color: const Color(0xFFA5A3A3),
              child: InkWell(
                onTap: () {},
                child: const SizedBox(
                  width: 200,
                  height: 200,
                  child: Icon(
                    Ionicons.person_sharp,
                    size: 150,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Login()));
            },
            child: const Text(
              'Cerrar sessión',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.red,
              ),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 39, 136, 42),
              ),
            ),
            onPressed: _requestAppDocumentsDirectory,
            child: const Text(
              'Exportar contraseñas',
            ),
          ),
          FutureBuilder<Directory?>(
            future: _externalDocumentsDirectory,
            builder: _buildDirectory,
          ),
        ],
      ),
    );
  }
}
