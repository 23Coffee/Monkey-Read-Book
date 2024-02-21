import 'package:booker_project/components/imgstore.dart';
import 'package:flutter/material.dart';
import 'package:booker_project/components/rounded_button.dart';
import 'package:booker_project/screen/login.dart';
import 'package:booker_project/screen/signup.dart';

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
        backgroundColor: const Color.fromARGB(255, 59, 59, 59),
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
                  FutureBuilder(
                    future: FireStoreDataBase().getData(), // Assuming this method fetches the image URL from Firestore
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text(
                          "Something went wrong: ${snapshot.error}",
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        // Use Image.network with the fetched URL
                        return Image.network(
                          snapshot.data.toString(),
                          alignment: Alignment.center,
                          height: 300,
                          width: 300,
                        );
                      }
                      // Return a loading indicator while fetching data
                      return Center(child: CircularProgressIndicator());
                    },
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
      ),
    );
  }
}
