import 'package:chat/utils/colors.dart';
import 'package:flutter/material.dart';

class RegisterTextButton extends StatelessWidget {
  const RegisterTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Navigator.pushReplacementNamed(context, "/register"),
      child: Column(
        children: [
          const Text("No tienes cuenta?", style: TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.w600)),
          const SizedBox(height: 5),
          Text("Crear una nueva cuenta aquí", style: TextStyle(color: ColorsTheme().primaryColor, fontSize: 18, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
 