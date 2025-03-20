import 'package:flutter/material.dart';
import 'package:dawol/services/chat_service.dart';
import 'package:go_router/go_router.dart';

class ChatListPage extends StatefulWidget {
  final String userId;

  ChatListPage({required this.userId});

  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  final ChatService chatService = ChatService();
  List<Map<String, dynamic>> chats = [];

  @override
  void initState() {
    super.initState();
    _fetchChats();
  }

  Future<void> _fetchChats() async {
    try {
      List<Map<String, dynamic>> fetchedChats = await chatService.getUserChats(
        widget.userId,
      );
      setState(() {
        chats = fetchedChats;
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Failed to load chats")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chats")),
      body:
          chats.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  final isGroupChat = chat.containsKey('name');
                  final chatName =
                      isGroupChat
                          ? chat['name']
                          : chat['participants']
                              .where((id) => id != widget.userId)
                              .join(', ');

                  return ListTile(
                    leading:
                        isGroupChat
                            ? Icon(Icons.group, color: Colors.blue)
                            : Icon(Icons.person, color: Colors.green),
                    title: Text(chatName),
                    subtitle: Text(chat['lastMessage'] ?? "No messages yet"),
                    onTap: () {
                      // ✅ Use GoRouter for navigation
                      context.push(
                        "/chat/${chat['_id']}",
                        extra: widget.userId,
                      );
                    },
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push("/new-chat", extra: widget.userId); // ✅ Pass userId
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
