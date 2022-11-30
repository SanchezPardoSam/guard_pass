import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guard_pass/domain/blocs/encrypt/encrypt_bloc.dart';
import 'package:guard_pass/domain/blocs/item/item_bloc.dart';
import 'package:guard_pass/ui/pages/Login/login.dart';

void main() {
  runApp(AppState());
}

// ignore: use_key_in_widget_constructors
class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ItemBloc>(create: (_) => ItemBloc()),
        BlocProvider<EncryptBloc>(create: (_) => EncryptBloc())
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
    );
  }
}
