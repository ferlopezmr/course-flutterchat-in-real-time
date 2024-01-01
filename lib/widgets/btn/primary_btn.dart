import 'package:chat/utils/colors.dart';
import 'package:flutter/material.dart';

class BtnPrimary extends StatelessWidget {
  final double? width;
  final String text;
  final IconData? icon;
  final void Function() onPressed;

  const BtnPrimary({super.key, this.width, required this.text, this.icon,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width?? widthScreen*0.45,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: ColorsTheme().primaryColor
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(icon != null) Icon(icon, color: Colors.white),
            if(icon != null) const SizedBox(width: 10),
            Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
        ),
    );
  }
}