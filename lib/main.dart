import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/auth_providers.dart';
import 'pages/login.dart';
import 'pages/signup.dart';
import 'pages/home_page.dart';
import 'pages/chats.dart';
import 'pages/chats2.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AuthProvider())],
      child: const DawolApp(),
    ),
  );
}

class DawolApp extends StatelessWidget {
  const DawolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dawol App',
      initialRoute: '/login',
      routes: {
        '/login': (context) => const Login(),
        '/signup': (context) => const SignUp(),
        '/home': (context) => const HomeClientsPage(),
        '/chats': (context) => const Chats(),
        '/chats2': (context) => const Chats2(),
      },
    );
  }
}
