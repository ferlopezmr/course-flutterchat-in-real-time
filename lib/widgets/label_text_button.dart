import 'package:chat/utils/colors.dart';
import 'package:flutter/material.dart';

class LabelTextButton extends StatelessWidget {
  final String title;
  final String route;
  final String subTitle;
  const LabelTextButton({super.key, required this.title, required this.route, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Navigator.pushReplacementNamed(context,route),
      child: Column(
        children: [
          Text(title, style:const TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.w600)),
          const SizedBox(height: 5),
          Text(subTitle, style: TextStyle(color: ColorsTheme().primaryColor, fontSize: 18, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
 