import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:training_journal/src/router/router.gr.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

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
                ExtendedNavigator.of(context)
                    .pushAndRemoveUntil(Routes.home, (route) => false);
              },
            ),
          ),
        ],
      ),
    );
  }
}
