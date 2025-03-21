import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  String? _token;
  String? _userId; // Store the userId after signup

  String? get userId => _userId;

  String? get token => _token;
  bool get isAuthenticated => _token != null;

  Future<bool> login(String email, String password) async {
    final response = await _authService.login(email, password);
    if (response != null && response['token'] != null) {
      _token = response['token'];
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> signUp(String email, String password) async {
    try {
      final response = await _authService.signUp(email, password);
      if (response != null) {
        _userId = response['userId']; // Store the userId
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Signup Error: $e");
      return false;
    }
  }
}
