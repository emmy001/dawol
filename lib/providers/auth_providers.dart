import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  String? _token;

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
    final response = await _authService.signUp(email, password);
    print("Signup API Response: $response");

    if (response != null && response.containsKey('token')) {
      _token = response['token'];
      notifyListeners();
      return true;
    } else {
      print("Signup failed, response did not contain a token.");
    }
    return false;
  }
}
