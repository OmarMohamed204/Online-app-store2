import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:loginpages/l10n/app_localizations.dart';

import 'package:loginpages/pages/home.dart';
import 'package:loginpages/pages/splash.dart';
import 'package:loginpages/provider/LanguageProvider.dart';
import 'package:loginpages/provider/cart.dart';
import 'package:loginpages/provider/favorites.dart';
import 'package:loginpages/provider/theme.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const OnlineStore());
}

class OnlineStore extends StatelessWidget {
  const OnlineStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Cart()),
        ChangeNotifierProvider(create: (context) => Favorites()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
      ],
      child: Consumer2<ThemeProvider, LanguageProvider>(
        builder: (context, themeValue, languageValue, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,

            // =========================
            // THEME
            // =========================
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),

            themeMode:
                themeValue.isDark ? ThemeMode.dark : ThemeMode.light,

            // =========================
            // LANGUAGE
            // =========================
            locale: languageValue.locale,

            supportedLocales: const [
              Locale('en'),
              Locale('ar'),
              Locale("tr"),
            ],

            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],

            home: SplashPage(),
          );
        },
      ),
    );
  }
}