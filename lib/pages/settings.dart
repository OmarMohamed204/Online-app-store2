import 'package:flutter/material.dart';
import 'package:loginpages/l10n/app_localizations.dart';
import 'package:loginpages/provider/theme.dart';
import 'package:loginpages/provider/LanguageProvider.dart';
import 'package:loginpages/shared/appBar.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool notifications = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final language = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 76, 141, 95),
        title: Text(
          l10n.settings,
          style: const TextStyle(
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

      body: ListView(
        padding: const EdgeInsets.all(15),

        children: [
          Text(
            l10n.general,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          Card(
            child: Column(
              children: [

                // =========================
                // DARK MODE
                // =========================
                ListTile(
                  title: Text(l10n.darkMode),
                  subtitle: Text(l10n.changeAppAppearance),
                  leading: const Icon(Icons.dark_mode),

                  trailing: Consumer<ThemeProvider>(
                    builder: (context, val, child) {
                      return Switch(
                        activeThumbColor: Colors.green,
                        activeTrackColor: Colors.black,
                        inactiveThumbColor: Colors.red,
                        inactiveTrackColor: Colors.white,
                        value: val.isDark,
                        onChanged: (value) {
                          val.toggleTheme();
                        },
                      );
                    },
                  ),
                ),

                const Divider(),

                // =========================
                // NOTIFICATIONS
                // =========================
                SwitchListTile(
                  secondary: const Icon(Icons.notifications),
                  title: Text(l10n.notifications),
                  subtitle: Text(l10n.receiveNotifications),
                  value: notifications,

                  onChanged: (value) {
                    setState(() {
                      notifications = value;
                    });
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // =========================
          // ACCOUNT
          // =========================
          Text(
            l10n.account,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          Card(
            child: Column(
              children: [

                // =========================
                // CHANGE PASSWORD
                // =========================
                ListTile(
                  leading: Icon(Icons.lock),
                  title: Text(l10n.changePassword),
                  trailing: Icon(Icons.arrow_forward_ios, size: 18),
                ),

                const Divider(),

                // =========================
                // LANGUAGE
                // =========================
                ListTile(
                  leading: const Icon(Icons.language),

                  title: Text(l10n.language),

                  subtitle: Text(
                    language.locale.languageCode == 'ar'
                        ? l10n.arabic
                        : language.locale.languageCode == 'tr'
                        ? l10n.turkish
                        : l10n.english,
                  ),

                  trailing: const Icon(Icons.arrow_forward_ios, size: 18),

                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(l10n.chooseLanguage),

                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [

                              // English
                              ListTile(
                                leading: const Text(
                                  "🇬🇧",
                                  style: TextStyle(fontSize: 25),
                                ),

                                title: Text(l10n.english),

                                trailing: language.locale.languageCode == 'en'
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.green,
                                      )
                                    : null,

                                onTap: () {
                                  language.changeLanguage(const Locale('en'));

                                  Navigator.pop(context);
                                },
                              ),

                              // Arabic
                              ListTile(
                                leading: const Text(
                                  "🇪🇬",
                                  style: TextStyle(fontSize: 25),
                                ),

                                title: Text(l10n.arabic),

                                trailing: language.locale.languageCode == 'ar'
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.green,
                                      )
                                    : null,

                                onTap: () {
                                  language.changeLanguage(const Locale('ar'));

                                  Navigator.pop(context);
                                },
                              ),

                              ListTile(
                                leading: const Text(
                                  '🇹🇷',
                                  style: TextStyle(fontSize: 25),
                                ),

                                title: Text(l10n.turkish),

                                trailing: language.locale.languageCode == 'tr'
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.green,
                                      )
                                    : null,

                                onTap: () {
                                  language.changeLanguage(const Locale('tr'));

                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          Center(
            child: Text(
              "${l10n.onlineStore}\n${l10n.version}",
              textAlign: TextAlign.center,
              style: TextStyle(color: Color.fromARGB(255, 104, 104, 104)),
            ),
          ),
        ],
      ),
    );
  }
}
