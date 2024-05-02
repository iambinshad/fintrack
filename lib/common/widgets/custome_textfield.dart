import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Widget suffix;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.suffix = const SizedBox()});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          suffix: suffix,
          hintText: hintText,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38))),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter your $hintText";
        } else {
          return null;
        }
      },
    );
  }
}
