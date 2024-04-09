import 'package:booker/components/imgstore.dart';
import 'package:booker/components/rounded_button.dart';
import 'package:booker/screen/login.dart';
import 'package:booker/screen/signup.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "Home Page",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // Replace FutureBuilder with Image.asset
                  Image.asset(
                    'assets/moneky.png', 
                    alignment: Alignment.center,
                    height: 300,
                    width: 300,
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  RoundedButton(
                    title: 'Log In',
                    colour: Color.fromARGB(255, 0, 0, 0),
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                  ),
                  RoundedButton(
                    title: 'Register',
                    colour: Color.fromARGB(255, 0, 0, 0),
                    onPressed: () {
                      Navigator.pushNamed(context, SignUpPage.id);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
