import 'package:blocs/blocs.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class LoginHome extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginHome());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => BlocProvider.of<AuthenticationBloc>(context)
                  .add(AuthenticationLoginRequested()),
              child: const Text('Login'),
            ),
            const Text('Placeholder'),
          ],
        ),
      ),
    );
  }
}
