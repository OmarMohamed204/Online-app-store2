import 'package:flutter/material.dart';
import 'package:loginpages/l10n/app_localizations.dart';
import 'package:loginpages/pages/edit_profile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = "Omar Mohamed";
  String email = "om3931930@gmail.com";

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.profile,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 76, 141, 95),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("assets/images/maloul.jpg"),
            ),

            const SizedBox(height: 20),

            Text(
              name,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(email, style: TextStyle(fontSize: 18)),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfile(name: name, email: email,)),
                );

                if (result != null) {
                  setState(() {
                    name = result["name"];
                    email = result["email"];
                  });
                }
              },
              icon: const Icon(Icons.edit),
              label: Text(l10n.editProfile),
            ),
          ],
        ),
      ),
    );
  }
}
