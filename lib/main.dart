import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/authentification.page.dart';
import 'pages/apropos.page.dart';
import 'pages/gallerie.page.dart';


import 'pages/pays.page.dart';

import 'pages/home.page.dart';
import 'pages/inscription.page.dart';
import 'pages/Excursion.dart';
import 'pages/contact.page.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    '/inscription': (context) =>  InscriptionPage(),
    '/authentification': (context) => AuthentificationPage(),
    '/home': (context) => const HomePage(),
    '/apropos': (context) => const apropos(),
    '/gallerie': (context) =>  GalleriePage(),
    '/pays': (context) =>  pays(),
    '/excursions': (context) => ExcursionsPage(),
    '/contact': (context) => ContactFormPage()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            bool conn = snapshot.data!.getBool('connecte') ?? false;
            if (conn) {
              return const HomePage();
            } else {
              return AuthentificationPage();
            }
          }
          return AuthentificationPage();
        },
      ),
    );
  }
}
