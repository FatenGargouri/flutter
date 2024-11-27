import 'package:flutter/material.dart';

import '../menu/drawer.page.dart';
class contact extends StatelessWidget {
  const contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text('contact'),
      ),
      body: const Center(
        child: Text('page contact',
        style: TextStyle(fontSize: 22),),


      ),
    );
  }
}
