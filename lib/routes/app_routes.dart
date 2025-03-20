import 'package:dawol/pages/appointments.dart';
import 'package:dawol/pages/chats/chats.dart';
import 'package:dawol/pages/chats/chats2.dart';
import 'package:dawol/pages/login.dart';
import 'package:dawol/pages/signup.dart';
import 'package:dawol/pages/splash_page.dart';
import 'package:go_router/go_router.dart';
import 'package:dawol/pages/home_page.dart';
import 'package:dawol/pages/menu.dart';
import 'package:dawol/pages/analytics.dart';
import 'package:dawol/pages/history.dart';
import 'package:dawol/pages/profile.dart';
import 'package:dawol/pages/chats/new_chat_page.dart';
import 'package:dawol/pages/chats/chat_page.dart';
import 'package:dawol/pages/chats/chat_list_page.dart';
import 'package:dawol/pages/profile/profile_completion_screen.dart';
import 'package:dawol/pages/profile/edit_profile_screen.dart';

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

    GoRoute(
      path: '/profile-completion',
      builder: (context, state) {
        final userId = state.extra as String; // Pass user ID as extra
        return ProfileCompletionScreen(userId: userId);
      },
    ),
    GoRoute(
      path: '/edit-profile',
      builder: (context, state) {
        final userData =
            state.extra as Map<String, dynamic>; // Pass user data as extra
        return EditProfileScreen(userData: userData);
      },
    ),
    GoRoute(
      path: "/chatlist",
      builder: (context, state) {
        final userId = state.extra as String; // Extract userId from `extra`
        return ChatListPage(userId: userId);
      },
    ),

    GoRoute(
      path: "/new-chat",
      builder: (context, state) {
        final userId = state.extra as String; // Extract userId from `extra`
        return NewChatPage(userId: userId);
      },
    ),

    // ✅ Dynamic chat route
    GoRoute(
      path: "/chat/:chatId",
      builder: (context, state) {
        final chatId = state.pathParameters["chatId"]!;
        final userId = state.extra as String; // Pass userId as extra
        return ChatPage(chatId: chatId, userId: userId);
      },
    ),
    GoRoute(
      path: "/new-chat",
      builder: (context, state) {
        final userId = state.extra as String; // Get userId from extra
        return NewChatPage(userId: userId);
      },
    ),
  ],
);
