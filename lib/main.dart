import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/auth_providers.dart';
import 'routes/app_routes.dart'; // Import your AppRouter

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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Dawol App',
      routerConfig: appRouter,
    );
  }
}
