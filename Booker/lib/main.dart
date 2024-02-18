
import 'package:booker_project/screen/login.dart';
import 'package:booker_project/screen/signinfo.dart';
import 'package:booker_project/screen/signup.dart';
import 'package:booker_project/screen/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyDuZwACFk5raByCKz04V0g0rpcIIUbgto4',
      appId: "1:1035452793612:android:f0fa0d4f288aa7a32dbf29",
      messagingSenderId: "1035452793612",
      projectId: "test1-4abd3", 
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        SignUpPage.id: (context) => SignUpPage(),
        Confirmation.id: (context) => Confirmation(),
      },
    );
  }
}