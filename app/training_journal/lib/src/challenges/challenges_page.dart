import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:training_journal/src/router/router.gr.dart';

class ChallengesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Challenges'),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: const Text('9C Test'),
              onTap: () {
                ExtendedNavigator.of(context).push(Routes.nineCPage);
              },
            ),
          )
        ],
      ),
    );
  }
}
