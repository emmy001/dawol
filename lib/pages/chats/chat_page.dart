import 'package:flutter/material.dart';
import 'package:dawol/services/chat_service.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatPage extends StatefulWidget {
  final String chatId;
  final String userId;

  const ChatPage({super.key, required this.chatId, required this.userId});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final ChatService _chatService = ChatService();
  final TextEditingController _messageController = TextEditingController();
  List<Map<String, dynamic>> _messages = [];
  late IO.Socket socket;

  @override
  void initState() {
    super.initState();
    _fetchMessages();
    _connectSocket();
  }

  void _connectSocket() {
    socket = IO.io("https://dawol-app-backend.vercel.app", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });

    socket.connect();
    socket.emit("joinChat", widget.chatId);

    socket.on("newMessage", (data) {
      setState(() {
        _messages.add(data);
      });
    });
  }

  void _startTyping() {
    socket.emit("typing", {"chatId": widget.chatId, "userId": widget.userId});
  }

  void _stopTyping() {
    socket.emit("stopTyping", {"chatId": widget.chatId});
  }

  void _editMessage(String messageId, String newText) {
    socket.emit("editMessage", {"messageId": messageId, "text": newText});
  }

  void _deleteMessage(String messageId) {
    socket.emit("deleteMessage", {"messageId": messageId});
  }

  Future<void> _fetchMessages() async {
    try {
      final messages = await _chatService.getMessages(widget.chatId);
      setState(() {
        _messages = messages;
      });
    } catch (error) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to load messages')));
    }
  }

  void _sendMessage() async {
    if (_messageController.text.isEmpty) return;

    final messageData = {
      'chatId': widget.chatId,
      'senderId': widget.userId,
      'text': _messageController.text,
    };

    socket.emit("sendMessage", messageData);
    setState(() {
      _messages.add(messageData);
    });

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ListTile(
                  title: Text(message['text']),
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Edit/Delete Message'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                _editMessage(message['_id'], "Updated Text");
                              },
                              child: Text('Edit'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                _deleteMessage(message['_id']);
                              },
                              child: Text(
                                'Delete',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(hintText: 'Type a message...'),
                  ),
                ),
                IconButton(icon: Icon(Icons.send), onPressed: _sendMessage),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
