import 'package:auto_route/auto_route.dart';
import 'package:blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_journal/src/router/router.gr.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

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
                    .pushAndRemoveUntil(Routes.homePage, (route) => false);
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Log Out'),
              onTap: () {
                BlocProvider.of<AuthenticationBloc>(context)
                    .add(AuthenticationLogoutRequested());
              },
            ),
          )
        ],
      ),
    );
  }
}
