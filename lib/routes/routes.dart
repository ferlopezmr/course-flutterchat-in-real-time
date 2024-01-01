
import 'package:chat/pages/loading_page.dart';
import 'package:chat/pages/login_page.dart';
import 'package:flutter/material.dart';

import '../pages/chat_page.dart';
import '../pages/register_page.dart';
import '../pages/users_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes ={
  "/login": (context) => const LoginPage(),
  "/register": (context) => const RegisterPage(),
  "/loading": (context) => const LoadingPage(),
  "/users": (context) => const UsersPage(),
  "/chat": (context) => const ChatPage(),
};