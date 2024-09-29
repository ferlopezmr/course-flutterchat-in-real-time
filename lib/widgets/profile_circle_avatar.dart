import 'package:chat/Models/users.dart';
import 'package:chat/utils/colors.dart';
import 'package:flutter/material.dart';

class UserCircleAvatar extends StatelessWidget {
  final String username;
  const UserCircleAvatar({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    ColorsTheme colorsTheme = ColorsTheme();

    return CircleAvatar(
      maxRadius: 14,
      backgroundColor: colorsTheme.lightPrimaryColor,
      child: Text(username),
    );
  }
}
