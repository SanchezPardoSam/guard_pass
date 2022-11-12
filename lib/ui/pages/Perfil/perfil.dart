import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guard_pass/ui/pages/Login/login.dart';
import 'package:ionicons/ionicons.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
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
            style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Color.fromARGB(255, 39, 136, 42),) ),
            onPressed: () {},
            child: Text(
              'Exportar contraseñas',
            ),
          ),
        ],
      ),
    );
  }
}
