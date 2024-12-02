import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InscriptionPage extends StatelessWidget {
  late SharedPreferences prefs;
  TextEditingController txt_login = TextEditingController();
  TextEditingController txt_password = TextEditingController();

  InscriptionPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Center(child: Text("Inscription ")),
            backgroundColor: Colors.blue),
        body: Column(
          children: [
            Center(
              child: Image.network(
                'images/inscrire.png', // URL to your image
                width: 150, // Adjust the size of the image
                height: 150,
                fit: BoxFit.cover, // To make the image fit correctly within the container
              ),
            ),
            const SizedBox(height: 20), // Space between the image and the form
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
                  _onInscrire(context);
                },
                style:
                ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                child: const Text("Inscription")),


            TextButton(onPressed: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, '/authentification');
            },
                child: const Text("J'ai deja un compte"))
          ],
        ));
  }


  Future<void> _onInscrire(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    if(txt_login.text.isNotEmpty && txt_password.text.isNotEmpty) {
      prefs.setString("login", txt_login.text);
      prefs.setString("password", txt_password.text);
      Navigator.pop(context);
      Navigator.pushNamed(context, '/home');
    }
    else{
      const snackBar=SnackBar(
        content: Text('Id ou mdp vides'),);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

    }

  }
}