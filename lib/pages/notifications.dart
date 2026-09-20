import 'package:flutter/material.dart';
import 'package:loginpages/l10n/app_localizations.dart';
import 'package:loginpages/provider/cart.dart';
import 'package:loginpages/provider/favorites.dart';
import 'package:loginpages/model/notification.dart';
import 'package:provider/provider.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final favorites = Provider.of<Favorites>(context);

    final l10n = AppLocalizations.of(context)!;

    List<NotificationModel> allNotifications = [
      ...cart.notifications_add,
      ...favorites.notifications_Fav,
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.notifications,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 76, 141, 95),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },

        child: Icon(Icons.home),
      ),

      body: allNotifications.isEmpty
          ? Center(
              child: Text(l10n.noNotifications, style: TextStyle(fontSize: 30)),
            )
          : Column(
              children: [
                const SizedBox(height: 20),

                Expanded(
                  child: ListView.builder(
                    itemCount: allNotifications.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: const CircleAvatar(
                            child: Icon(
                              Icons.notifications,
                              color: Colors.green,
                            ),
                          ),

                          title: Text(
                            allNotifications[index].title,
                            style: const TextStyle(
                              // color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),

                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                allNotifications[index].message,
                                style: const TextStyle(
                                  // color: Color.fromARGB(255, 34, 6, 171),
                                ),
                              ),

                              const SizedBox(height: 5),

                              Text(
                                allNotifications[index].time,
                                style: const TextStyle(
                                  // color: Color.fromARGB(255, 23, 19, 19),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 30),

                ElevatedButton(
                  onPressed: () {
                    cart.clearNotifications();
                    favorites.clearNotifications_fav();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      // color: Colors.grey,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(l10n.clearAll, style: TextStyle(fontSize: 22)),
                  ),
                ),

                const SizedBox(height: 50),
              ],
            ),
    );
  }
}
