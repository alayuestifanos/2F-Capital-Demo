import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.height,
    required this.headerText,
    required this.hintText,
    required this.controller,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
  });
  final double height;
  final String headerText;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headerText,
          style: const TextStyle(
            color: Colors.black54,
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
                fontSize: 12.0,
                color: Colors.black54,
                fontWeight: FontWeight.bold),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            contentPadding: const EdgeInsets.only(left: 18),
          ),
        ),
        SizedBox(
          height: height * 0.05,
        ),
      ],
    );
  }
}
