import 'package:flutter/material.dart';
import 'package:loginpages/l10n/app_localizations.dart';
import 'package:loginpages/shared/appBar.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 76, 141, 95),
        title: Text(
          l10n.contactUs,
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [ProductAndPrice()],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const SizedBox(height: 30),

            const Icon(
              Icons.contact_support,
              size: 90,
              color: Color.fromARGB(255, 76, 141, 95),
            ),

            const SizedBox(height: 20),

            Text(
              l10n.getInTouch,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              l10n.happyToHear,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 30),

            ListTile(
              leading: Icon(Icons.phone),
              title: Text(l10n.phone),
              subtitle: Text("+20 114 389 7389"),
            ),

            const Divider(),

            ListTile(
              leading: Icon(Icons.email),
              title: Text(l10n.email),
              subtitle: Text("om3931930@gmail.com"),
            ),

            const Divider(),

            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(l10n.location),
              subtitle: Text("BeniSwif, Egypt"),
            ),
          ],
        ),
      ),
    );
  }
}
