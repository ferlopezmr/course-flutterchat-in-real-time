import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Icon icon;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;
  const CustomTextField({super.key, required this.icon, required this.placeholder, required this.textController, required this.keyboardType, required this.isPassword});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 3, right: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, 5),
                  blurRadius: 5)
            ]),
        child: TextField(
            obscureText: isPassword,
            controller: textController,
            autocorrect: false,
            keyboardType: keyboardType,
            decoration: InputDecoration(
                prefixIcon: icon,
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                hintText: placeholder)));
  }
}
