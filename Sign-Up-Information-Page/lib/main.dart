import 'package:flutter/material.dart';
import 'package:lab4_2/components/input.dart';
import 'package:lab4_2/screen/signinfo.dart';
import 'package:lab4_2/screen/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => SignUpPage(),
        '/second': (context) {
          final User? user = ModalRoute.of(context)?.settings.arguments as User?;
          return NextPage(user: user);
        },
      },
    );
  }
}
