import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class UserService {
  static const String _baseUrl =
      'https://dawol-app-backend.vercel.app/api'; // Replace with your backend URL

  // ✅ Register a new user
  static Future<Map<String, dynamic>> registerUser(
    Map<String, dynamic> userData,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/auth/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(userData),
      );

      print("🚀 Raw API Response: ${response.body}"); // Log API response

      if (response.statusCode == 201) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);

        print("✅ Parsed Response: $responseData"); // Log parsed response

        // Extract userId and token with null checks
        final String userId =
            responseData['user']?['_id']?.toString() ?? ''; // Ensure string
        final String token =
            responseData['token']?.toString() ?? ''; // Ensure string

        print("🆔 User ID: $userId");
        print("🔑 Token: $token");

        if (userId.isEmpty || token.isEmpty) {
          throw Exception("Error: userId or token is missing!");
        }

        return {'userId': userId, 'token': token, ...responseData};
      } else {
        print("❌ API Error: ${response.body}");
        throw Exception('Failed to register user: ${response.body}');
      }
    } catch (e) {
      print("❌ Exception: $e");
      throw Exception('Failed to register user.');
    }
  }

  // ✅ Complete user profile
  static Future<Map<String, dynamic>?> completeProfile(
    String userId,
    Map<String, dynamic> profileData,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/users/complete-profile/$userId'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(profileData),
      );

      print("📝 Complete Profile Response: ${response.body}");

      if (response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to complete profile: ${response.body}');
      }
    } catch (e) {
      print("❌ Error completing profile: $e");
      throw Exception('Failed to complete profile.');
    }
  }

  // ✅ Fetch user details
  static Future<Map<String, dynamic>> getUserDetails(String userId) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/users/$userId'));

      print("👤 User Details Response: ${response.body}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to fetch user details: ${response.body}');
      }
    } catch (e) {
      print("❌ Error fetching user details: $e");
      throw Exception('Failed to fetch user details.');
    }
  }

  // ✅ Update user profile
  static Future<Map<String, dynamic>> updateUserProfile(
    String userId,
    Map<String, dynamic> updatedData,
  ) async {
    try {
      final response = await http.put(
        Uri.parse('$_baseUrl/users/$userId'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(updatedData),
      );

      print("✏️ Update User Response: ${response.body}");

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to update user profile: ${response.body}');
      }
    } catch (e) {
      print("❌ Error updating user profile: $e");
      throw Exception('Failed to update user profile.');
    }
  }

  // ✅ Upload Profile Picture
  static Future<String> uploadProfilePicture(File imageFile) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('$_baseUrl/users/upload-profile-picture'),
      );

      request.files.add(
        await http.MultipartFile.fromPath(
          'profile_picture',
          imageFile.path,
          contentType: MediaType('image', 'jpeg'),
        ),
      );

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData['imageUrl'];
      } else {
        throw Exception('Failed to upload profile picture: ${response.body}');
      }
    } catch (e) {
      throw Exception('Image upload error: $e');
    }
  }
}
