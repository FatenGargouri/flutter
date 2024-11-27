import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthentificationPage extends StatelessWidget {
  TextEditingController txt_login = TextEditingController();
  TextEditingController txt_password = TextEditingController();
  late SharedPreferences prefs;

  AuthentificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Authentification ")),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: txt_login,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    hintText: "identifinat",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(width: 1))),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: txt_password,
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password),
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(width: 1))),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  _onConnect(context);
                },
                style:
                ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                child: const Text("Connexion")),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context,'/inscription');
                },
                child: const Text("S'inscrire"))
          ],
        ));
  }

  Future<void> _onConnect(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    String log = prefs.getString("login") ?? '';
    String psw = prefs.getString("password") ?? '';
    print(txt_password.text);
    if (txt_login.text == log && txt_password.text == psw) {
      Navigator.pop(context);
      Navigator.pushNamed(context, '/home');
    }else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Erreur de connexion"),
            content: const Text("Identifiant ou mot de passe incorrect"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }
}

