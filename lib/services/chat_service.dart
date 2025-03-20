import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatService {
  final String baseUrl = "https://dawol-app-backend.vercel.app/api/chats";
  // get users
  Future<List<Map<String, dynamic>>> getUsers() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/users"));

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        return List<Map<String, dynamic>>.from(data);
      } else {
        throw Exception("Failed to load users");
      }
    } catch (e) {
      throw Exception("Error fetching users: $e");
    }
  }

  // ✅ Get user chats dynamically
  Future<List<Map<String, dynamic>>> getUserChats(String userId) async {
    final response = await http.get(Uri.parse('$baseUrl/user/$userId'));
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load chats');
    }
  }

  // ✅ Fetch messages dynamically
  Future<List<Map<String, dynamic>>> getMessages(String chatId) async {
    final response = await http.get(Uri.parse('$baseUrl/$chatId'));
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load messages');
    }
  }

  // ✅ Send message
  Future<void> sendMessage(String chatId, String senderId, String text) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$chatId/message'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'sender_id': senderId, 'text': text}),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to send message');
    }
  }

  // ✅ Create a new chat with optional groupName
  Future<void> createChat(
    List<String> participants, {
    String? groupName,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'participants': participants,
        if (groupName != null && groupName.isNotEmpty)
          'groupName': groupName, // ✅ Include if provided
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create chat');
    }
  }
}
