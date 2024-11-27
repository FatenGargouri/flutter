import 'package:flutter/material.dart';

import '../menu/drawer.page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Center(child: Text("Home page")),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Wrap(
          children: [
            InkWell(
              child: Ink.image(
                  height:180,
                  width: 180,
                  image: const AssetImage('images/meteo.png')),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context,"/metio");
              },
            ),
            InkWell(
              child: Ink.image(
                  height:180,
                  width: 180,
                  image: const AssetImage('images/contact.png')),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context,"/contact");
              },
            ),
            InkWell(
              child: Ink.image(
                  height:180,
                  width: 180,
                  image: const AssetImage('images/gallerie.png')),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context,"/gallerie");
              },
            ),
            InkWell(
              child: Ink.image(
                  height:180,
                  width: 180,
                  image: const AssetImage('images/parametres.png')),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context,"/parametre");
              },
            ),
            InkWell(
              child: Ink.image(
                  height:180,
                  width: 180,
                  image: const AssetImage('images/pays.png')),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context,"/pays");
              },
            ),
            InkWell(
              child: Ink.image(
                  height:180,
                  width: 180,
                  image: const AssetImage('images/deconnexion.png')),
              onTap: (){
                _onDeconnexionPressed(context);
              },
            )
          ],
        ),
      ),
    );
  }

  // Fonction pour gérer le bouton de déconnexion
  Future<void> _onDeconnexionPressed(BuildContext context) async {
    // Code de déconnexion ici (par exemple, suppression des informations de connexion)
    // Vous pouvez ici supprimer les données d'identification stockées ou effectuer d'autres actions nécessaires

    // Navigation vers la page d'authentification et suppression des routes précédentes
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/authentification', // Route de la page d'authentification
          (route) => false, // Supprimer toutes les routes précédentes
    );
  }

}


