import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({required this.title, required this.colour, required this.onPressed});

  final Color colour;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            // Call the onPressed function when the button is pressed
            onPressed();
          },
          minWidth: 200.0,
          height: 42.0,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30
              ),
            ),
          ),
        ),
      ),
    );
  }
}
