import 'package:flutter/material.dart';
import 'meteo-details.page.dart';
import '../menu/drawer.page.dart';

class metio extends StatelessWidget {
 
  const metio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController txtVille = TextEditingController();

    void _onGetMeteoDetails(BuildContext context) {
      String ville = txtVille.text;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MeteoDetailsPage(ville) ),
      );
      txtVille.clear();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Page Meteo")),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: txtVille,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.location_city),
                hintText: "Ville",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(width: 1),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _onGetMeteoDetails(context);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(50),
            ),
            child: const Text("Chercher"),
          ),
        ],
      ),
    );
  }
}
