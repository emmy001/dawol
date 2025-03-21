import 'package:flutter/material.dart';
import 'package:dawol/services/user_service.dart';

class UserProvider with ChangeNotifier {
  final UserService _userService = UserService();

  Future<bool> completeProfile({
    required String userId,
    required Map<String, dynamic> profileData,
  }) async {
    try {
      final response = await _userService.completeProfile(userId, profileData);
      return response != null;
    } catch (e) {
      print("Complete Profile Error: $e");
      return false;
    }
  }
}
