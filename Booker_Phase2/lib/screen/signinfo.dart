import 'package:booker/components/input.dart';
import 'package:booker/screen/login.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class Confirmation extends StatefulWidget {
  static const String id = 'confirmation_screen';
  final User2? user;

  Confirmation({this.user});

  @override
  State<Confirmation> createState() => _ConfirmationState();
}

class _ConfirmationState extends State<Confirmation> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _registerUser() async {
    try {
      // Attempt to create user with email and password in firebase authentication
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: widget.user!.email!,
        password: widget.user!.password!,
      );

      // Add user information to Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': widget.user!.name,
        'surname': widget.user!.surname,
        'email': widget.user!.email,
        'phoneNumber': widget.user!.phoneNumber,
      });

      // Navigate to the confirmation page
      Navigator.pop(context);
    } catch (e) {
      // Handle any errors
      print('Error registering user: $e');
      // Show error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error registering user: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 59, 59, 59),
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            "Confirmation Page",
            style: TextStyle(color: Colors.white),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/user-login.png",
                  width: 150,
                  height: 150,
                ),
              ),
              if (widget.user != null) ...[
                UserInfoItem(label: 'Name', value: widget.user!.name ?? '-'),
                UserInfoItem(label: 'Surname', value: widget.user!.surname ?? '-'),
                UserInfoItem(label: 'Email', value: widget.user!.email ?? '-'),
                UserInfoItem(label: 'Phone Number', value: widget.user!.phoneNumber ?? '-'),
                UserInfoItem(label: 'Password', value: widget.user!.password ?? '-'),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  onPressed: () {
                    _registerUser();
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class UserInfoItem extends StatelessWidget {
  final String label;
  final String value;

  const UserInfoItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
          Divider(),
        ],
      ),
    );
  }
}