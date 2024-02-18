
import 'package:booker_project/components/rounded_button.dart';
import 'package:booker_project/screen/signup.dart';
import 'package:flutter/material.dart';

import 'login.dart';



class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 59, 59, 59),
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "Home Page",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset(
                  "assets/user-login.png",
                  alignment: Alignment.center,
                  height: 300,
                  width: 300,
                  ),
                SizedBox(
                  height: 48.0,
                ),
                RoundedButton(
                  title: 'Log In',
                  
                  colour: Colors.lightBlueAccent,
                  
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                ),
                RoundedButton(
                  title: 'Register',
                  colour: Colors.blueAccent,
                  onPressed: () {
                    Navigator.pushNamed(context, SignUpPage.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
