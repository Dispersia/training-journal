import 'package:blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:repositories/repositories.dart';

import 'package:training_journal/src/src.dart';

class App extends StatelessWidget {
  final AuthRepository authRepository;

  const App({
    Key key,
    @required this.authRepository,
  })  : assert(authRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authRepository: authRepository,
        ),
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is AuthenticationUnauthenticated ||
                state is AuthenticationLogInFailure) {
              _navigator.pushAndRemoveUntil<void>(
                LoginHome.route(),
                (route) => false,
              );
            } else if (state is AuthenticationAuthenticated) {
              _navigator.pushAndRemoveUntil<void>(
                Home.route(),
                (route) => false,
              );
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }

  @override
  void initState() {
    BlocProvider.of<AuthenticationBloc>(context)
        .add(AuthenticationRefreshRequested());
    super.initState();
  }
}
