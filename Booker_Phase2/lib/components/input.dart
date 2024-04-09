import 'package:flutter/material.dart';


class User2 {
  final String name;
  final String surname;
  final String email;
  final String phoneNumber;
  final String password;

  User2({
    required this.name,
    required this.surname,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });
}



class FormContainerWidget extends StatefulWidget {
  final TextEditingController? controller;
  final bool? isPasswordField;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;
  

  const FormContainerWidget({
    this.controller,
    this.isPasswordField,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.inputType,
    
  });

  @override
  _FormContainerWidgetState createState() => new _FormContainerWidgetState();
}

class _FormContainerWidgetState extends State<FormContainerWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.35),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        controller: widget.controller,
        keyboardType: widget.inputType,
        obscureText: widget.isPasswordField == true ? _obscureText : false,
        onSaved: widget.onSaved,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.black45),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: widget.isPasswordField == true
                ? Icon(
                    _obscureText
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: _obscureText == false ? Colors.blue : Colors.grey,
                  )
                : Text(""),
          ),
        ),
      ),
    );
  }
}
