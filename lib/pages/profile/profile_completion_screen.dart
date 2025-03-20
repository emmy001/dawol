import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:dawol/services/user_service.dart';

class ProfileCompletionScreen extends StatefulWidget {
  final String userId; // Pass the user ID after login

  ProfileCompletionScreen({required this.userId});

  @override
  _ProfileCompletionScreenState createState() =>
      _ProfileCompletionScreenState();
}

class _ProfileCompletionScreenState extends State<ProfileCompletionScreen> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _userData = {
    'full_name': '',
    'username': '',
    'phone': '',
    'gender': 'male',
    'dob': '',
    'bio': '',
    'profile_picture': '',
    'location': {
      'city': '',
      'country': '',
      'geo': {'lat': 0.0, 'lng': 0.0},
    },
    'hourly_rate': 0,
  };

  File? _profileImage;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Upload profile picture if selected
      if (_profileImage != null) {
        // Implement image upload logic here
      }

      try {
        final response = await UserService.updateUserProfile(
          widget.userId,
          _userData,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profile completed successfully!')),
        );
        Navigator.pushReplacementNamed(
          context,
          '/home',
        ); // Navigate to the home screen
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
      appBar: AppBar(title: Text('Complete Your Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Full Name'),
                onSaved: (value) => _userData['full_name'] = value,
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Username'),
                onSaved: (value) => _userData['username'] = value,
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone'),
                onSaved: (value) => _userData['phone'] = value,
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              DropdownButtonFormField(
                value: _userData['gender'],
                items:
                    ['male', 'female', 'other'].map((gender) {
                      return DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      );
                    }).toList(),
                onChanged: (value) => _userData['gender'] = value,
                decoration: InputDecoration(labelText: 'Gender'),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Date of Birth (YYYY-MM-DD)',
                ),
                onSaved: (value) => _userData['dob'] = value,
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'City'),
                onSaved: (value) => _userData['location']['city'] = value,
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Country'),
                onSaved: (value) => _userData['location']['country'] = value,
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Upload Profile Picture'),
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Save Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
