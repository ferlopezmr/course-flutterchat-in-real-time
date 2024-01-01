import 'package:chat/utils/colors.dart';
import 'package:chat/widgets/btn/primary_btn.dart';
import 'package:chat/widgets/custom_text_field.dart';
import 'package:chat/widgets/logo_area.dart';
import 'package:chat/widgets/register_text_button.dart'; 
import 'package:flutter/material.dart';

import '../widgets/label_text_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ColorsTheme colorTheme = ColorsTheme();
  late double width;
  late double height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: colorTheme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            height: height * 0.9,
            padding: EdgeInsets.symmetric(horizontal: width * 0.09, vertical: height * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const LogoArea(text: "Login"),
                _formArea(),
                BtnPrimary( text: "Login", onPressed: ()=> _login(),),
                const SizedBox(height: 20),
                const LabelTextButton(title: "¿Aún no tienes cuenta?", subTitle: "Crea tu cuenta aquí", route: "/register",),
              ],
            ),
          ),
        ),
      ),
    );
  }

 

  Future<void> _login() async{
    print(emailController.text);
    print(passwordController.text);
  }

  Widget _formArea(){
    return  Column(
      children: [
        CustomTextField(icon: const Icon(Icons.mail), placeholder: "Ingresa el mail", textController: emailController, keyboardType: TextInputType.emailAddress, isPassword: false),
        SizedBox(height: height * 0.03),
        CustomTextField(icon: const Icon(Icons.lock), placeholder: "Ingresa la contraseña", textController: passwordController, keyboardType: TextInputType.text, isPassword: true),
      ],
    );
  }

}






