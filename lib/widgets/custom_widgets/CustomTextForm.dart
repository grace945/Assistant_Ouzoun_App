import 'package:flutter/material.dart';
import '../../core/constances/colors.dart';

class CustomTextForm extends StatelessWidget {
  CustomTextForm({
    super.key,
    required this.obscureText,
    required this.mycontroller,
    required this.hinttext,
    required this.validator,
    this.suffixIcon,
  });
  final TextEditingController mycontroller;
  final String hinttext;
  final String? Function(String?) validator;
  final Widget? suffixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: green,
      validator: validator,
      controller: mycontroller,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: TextStyle(
          fontSize: 13,
          color: Colors.grey[500],
          fontFamily: "Montserrat",
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.green),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: green),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: green, width: 2.0),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
