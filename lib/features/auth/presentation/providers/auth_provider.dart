import 'package:flutter/material.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/signup_usecase.dart';
import '../../domain/entities/user_entity.dart';

class AuthProvider with ChangeNotifier {
  final LoginUseCase loginUseCase;
  final SignUpUseCase signUpUseCase;

  AuthProvider({required this.loginUseCase, required this.signUpUseCase});

  UserEntity? _user;
  UserEntity? get user => _user;

  Future<void> login(String email, String password) async {
    _user = await loginUseCase(email, password);
    notifyListeners();
  }

  Future<void> signUp(String email, String password) async {
    _user = await signUpUseCase(email, password);
    notifyListeners();
  }
}
