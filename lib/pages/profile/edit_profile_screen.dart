import 'package:flutter/material.dart';
import 'package:dawol/services/user_service.dart';

class EditProfileScreen extends StatefulWidget {
  final Map<String, dynamic> userData;

  const EditProfileScreen({super.key, required this.userData});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late Map<String, dynamic> _updatedData;

  @override
  void initState() {
    super.initState();
    _updatedData = Map.from(widget.userData);

    // Ensure required fields are not null
    _updatedData['full_name'] ??= '';
    _updatedData['username'] ??= '';
    _updatedData['phone'] ??= '';
    _updatedData['gender'] ??= 'male';
    _updatedData['location'] ??= {'city': '', 'country': ''};
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        final response = await UserService.updateUserProfile(
          widget.userData['_id'],
          _updatedData,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profile updated successfully!')),
        );
        Navigator.pop(context); // Go back to the profile screen
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _updatedData['full_name'],
                decoration: InputDecoration(labelText: 'Full Name'),
                onSaved: (value) => _updatedData['full_name'] = value,
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                initialValue: _updatedData['username'],
                decoration: InputDecoration(labelText: 'Username'),
                onSaved: (value) => _updatedData['username'] = value,
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                initialValue: _updatedData['phone'],
                decoration: InputDecoration(labelText: 'Phone'),
                onSaved: (value) => _updatedData['phone'] = value,
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              DropdownButtonFormField(
                value: _updatedData['gender'],
                items:
                    ['male', 'female', 'other'].map((gender) {
                      return DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      );
                    }).toList(),
                onChanged: (value) => _updatedData['gender'] = value,
                decoration: InputDecoration(labelText: 'Gender'),
              ),
              TextFormField(
                initialValue: _updatedData['location']['city'],
                decoration: InputDecoration(labelText: 'City'),
                onSaved: (value) => _updatedData['location']['city'] = value,
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                initialValue: _updatedData['location']['country'],
                decoration: InputDecoration(labelText: 'Country'),
                onSaved: (value) => _updatedData['location']['country'] = value,
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
