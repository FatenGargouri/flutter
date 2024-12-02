import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthentificationPage extends StatelessWidget {
  final TextEditingController txtLogin = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();
  late SharedPreferences prefs;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AuthentificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Authentification")),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Image added from the external URL
            Center(
              child: Image.network(
                'images/auth.png', // URL to your image
                width: 150, // Adjust the size of the image
                height: 150,
                fit: BoxFit.cover, // To make the image fit correctly within the container
              ),
            ),
            const SizedBox(height: 20), // Space between the image and the form
            Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildTextFormField(
                    controller: txtLogin,
                    icon: Icons.person,
                    hintText: "Identifiant",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Veuillez entrer votre identifiant";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildTextFormField(
                    controller: txtPassword,
                    icon: Icons.password,
                    hintText: "Mot de passe",
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Veuillez entrer votre mot de passe";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _onConnect(context);
                    },
                    style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                    child: const Text("Connexion"),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/inscription');
                    },
                    child: const Text("S'inscrire"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required IconData icon,
    required String hintText,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1),
        ),
      ),
      validator: validator,
    );
  }

  Future<void> _onConnect(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      // Si le formulaire n'est pas valide, on ne continue pas.
      return;
    }

    prefs = await SharedPreferences.getInstance();
    String log = prefs.getString("login") ?? '';
    String psw = prefs.getString("password") ?? '';

    // Vérification des identifiants
    if (txtLogin.text == log && txtPassword.text == psw) {
      // Connexion réussie
      Navigator.pop(context);
      Navigator.pushNamed(context, '/home');
    } else {
      // Affichage d'un message d'erreur en cas d'échec
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