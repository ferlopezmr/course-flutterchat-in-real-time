import 'package:flutter/material.dart';

import '../utils/colors.dart';

class LogoArea extends StatelessWidget {
  final String text;
  const LogoArea({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            width: 170,
            child:const Image(
              image: AssetImage('assets/images/logo.png'),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Text(text, style: TextStyle(fontSize: 30, color: ColorsTheme().primaryColor, fontWeight: FontWeight.bold))
          ),
        ],
      ),
    );
  }
}
 