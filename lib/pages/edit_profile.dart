import 'dart:math';

import 'package:flutter/material.dart';
import 'package:loginpages/l10n/app_localizations.dart';

class EditProfile extends StatefulWidget {
  final String name;
  final String email;

  const EditProfile({super.key, required this.name, required this.email});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController nameController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);

    emailController = TextEditingController(text: widget.email);
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.editProfile,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 76, 141, 95),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: l10n.name,
                prefix: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: l10n.email,
                prefix: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context, {
                  "name": nameController.text,
                  "email": emailController.text,
                });
              },
              icon: const Icon(Icons.save),
              label: Text(l10n.save),
            ),
          ],
        ),
      ),
    );
  }
}
