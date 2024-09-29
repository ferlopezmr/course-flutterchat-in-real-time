import 'package:chat/utils/colors.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  final String text;
  final bool isTheirMessage;
  final AnimationController animationController;
  const ChatMessages({super.key, required this.text, required this.isTheirMessage, required this.animationController,});

  @override
  Widget build(BuildContext context) {
    ColorsTheme colorsTheme = ColorsTheme();
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(parent: animationController, curve: Curves.easeOut),
        child: Container( 
          child: _userMessage(colorsTheme)  
        ),
      ),
    );
  }

  Widget _userMessage(ColorsTheme colorsTheme){
    return Align(
      alignment: isTheirMessage? Alignment.centerRight:Alignment.centerLeft,
      child: Container(
        margin:  EdgeInsets.only(top: 10, right: isTheirMessage? 5 : 50, left:  isTheirMessage? 50 : 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:  isTheirMessage? colorsTheme.primaryColor : colorsTheme.lightPrimaryColor
        ),
        padding: const EdgeInsets.all(10.0),
        child: Text(text, style: TextStyle(color: isTheirMessage? Colors.white:colorsTheme.primaryColor),),
      ),
    );
  }

 
}