import 'package:flutter/material.dart';
import 'package:loginpages/l10n/app_localizations.dart';
import 'package:loginpages/shared/appBar.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 76, 141, 95),
        title: Text(
          l10n.aboutUs,
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [ProductAndPrice()],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },

        child: Icon(Icons.home),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            // Logo
            Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 76, 141, 95),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Icon(
                Icons.shopping_bag_rounded,
                size: 60,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 20),

            // App Name
            Text(
              l10n.onlineStore,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 76, 141, 95),
              ),
            ),

            const SizedBox(height: 8),

            Text(
              l10n.shopMoreSaveMore,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 30),

            // About
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                l10n.aboutOnlineStore,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 12),

            Text(
              l10n.aboutDescription,
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                // color: Colors.black87,
              ),
            ),

            const SizedBox(height: 25),

            // Categories
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                l10n.whatYouCanFind,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 15),

            categoryItem(
              icon: Icons.checkroom,
              title: l10n.clothes,
              subtitle: l10n.clothesDescription,
            ),

            categoryItem(
              icon: Icons.directions_car,
              title: l10n.cars,
              subtitle: l10n.carsDescription,
            ),

            categoryItem(
              icon: Icons.local_florist,
              title: l10n.flowers,
              subtitle: l10n.flowersDescription,
            ),

            const SizedBox(height: 30),

            Text(
              l10n.shopMoreSaveMore,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 76, 141, 95),
              ),
            ),

            const SizedBox(height: 15),

            Text(
              l10n.developedByOmar,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 110, 109, 109),
                height: 1.5,
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  static Widget categoryItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),

        leading: CircleAvatar(
          radius: 25,
          backgroundColor: const Color.fromARGB(255, 76, 141, 95),
          child: Icon(icon, color: Colors.white),
        ),

        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),

        subtitle: Text(subtitle),
      ),
    );
  }
}
