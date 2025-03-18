import 'package:dawol/pages/appointments.dart';
import 'package:dawol/pages/chats.dart';
import 'package:dawol/pages/chats2.dart';
import 'package:dawol/pages/login.dart';
import 'package:dawol/pages/signup.dart';
import 'package:dawol/pages/splash_page.dart';
import 'package:go_router/go_router.dart';
import 'package:dawol/pages/home_page.dart';
import 'package:dawol/pages/menu.dart';
import 'package:dawol/pages/analytics.dart';
import 'package:dawol/pages/history.dart';
import 'package:dawol/pages/profile.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: "/splash",
  routes: [
    GoRoute(path: "/splash", builder: (context, state) => Splash()),
    GoRoute(path: "/signup", builder: (context, state) => SignUp()),
    GoRoute(path: "/login", builder: (context, state) => Login()),
    GoRoute(path: "/home", builder: (context, state) => HomeClientsPage()),
    GoRoute(path: "/chats", builder: (context, state) => Chats()),
    GoRoute(path: "/chat2", builder: (context, state) => Chats2()),
    GoRoute(path: "/menu", builder: (context, state) => Menu()),
    GoRoute(path: "/analytics", builder: (context, state) => Analytics()),
    GoRoute(path: "/history", builder: (context, state) => History()),
    GoRoute(path: "/profile", builder: (context, state) => Profile()),
    GoRoute(path: "/appointment", builder: (context, state) => Appointments()),
  ],
);
