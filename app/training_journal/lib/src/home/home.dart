import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => Home());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: const Text('Challenges'),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  'challenges',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
