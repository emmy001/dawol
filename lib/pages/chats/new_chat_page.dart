import 'package:flutter/material.dart';
import 'package:dawol/services/chat_service.dart';

class NewChatPage extends StatefulWidget {
  final String userId;

  NewChatPage({required this.userId});

  @override
  _NewChatPageState createState() => _NewChatPageState();
}

class _NewChatPageState extends State<NewChatPage> {
  final ChatService chatService = ChatService();
  List<Map<String, dynamic>> users = [];
  List<String> selectedUsers = [];
  final TextEditingController groupNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    try {
      List<Map<String, dynamic>> fetchedUsers = await chatService.getUsers();
      setState(() {
        users = fetchedUsers;
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Failed to load users")));
    }
  }

  void _toggleSelection(String userId) {
    setState(() {
      if (selectedUsers.contains(userId)) {
        selectedUsers.remove(userId);
      } else {
        selectedUsers.add(userId);
      }
    });
  }

  void _createChat() async {
  if (selectedUsers.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Select at least one user")),
    );
    return;
  }

  try {
    await chatService.createChat(
      [widget.userId, ...selectedUsers], // ✅ Include logged-in user
      groupName: groupNameController.text.trim().isEmpty 
        ? null 
        : groupNameController.text.trim(), // ✅ Pass group name if not empty
    );

    Navigator.pop(context);
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Failed to create chat")),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Chat")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: groupNameController,
              decoration: InputDecoration(
                labelText: "Group Name (Optional)",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child:
                users.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        final user = users[index];
                        final isSelected = selectedUsers.contains(user["_id"]);

                        return ListTile(
                          title: Text(user["name"]),
                          trailing: Icon(
                            isSelected
                                ? Icons.check_circle
                                : Icons.circle_outlined,
                            color: isSelected ? Colors.blue : Colors.grey,
                          ),
                          onTap: () => _toggleSelection(user["_id"]),
                        );
                      },
                    ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _createChat,
              child: Text("Start Chat"),
            ),
          ),
        ],
      ),
    );
  }
}
