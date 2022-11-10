import 'package:flutter/material.dart';
import 'package:guard_pass/ui/pages/Login/login.dart';
import 'package:guard_pass/ui/widgets/social_media.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Image.asset(
              'assets/logos/logo.png',
              height: 150,
            ),
            Container(
              height: 250,
              padding: const EdgeInsets.all(0),
              margin: const EdgeInsets.only(
                  right: 20, left: 20, bottom: 0, top: 20),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      textAlign: TextAlign.start,
                      decoration: const InputDecoration(
                        hintText: 'Email',
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
                      onSaved: (String? value) {},
                      validator: (String? value) {
                        return null;
                      },
                    ),
                    TextFormField(
                      textAlign: TextAlign.start,
                      decoration: const InputDecoration(
                        hintText: 'Username',
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
                      onSaved: (String? value) {},
                      validator: (String? value) {
                        return null;
                      },
                    ),
                    TextFormField(
                      textAlign: TextAlign.start,
                      decoration: const InputDecoration(
                        hintText: 'Password',
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
                      onSaved: (String? value) {},
                      validator: (String? value) {
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.only(
                  left: 36,
                  right: 36,
                )),
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xFFD9D9D9)),
              ),
              child: const Text(
                'SIGN UP',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SocialMediaContainer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '¿Tienes cuenta?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
