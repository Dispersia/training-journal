import 'package:auto_route/auto_route.dart';
import 'package:blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:repositories/repositories.dart';
import 'package:training_journal/src/router/router.gr.dart';

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
  AppView({Key key}) : super(key: key);

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: ExtendedNavigator.builder(
        initialRoute: Routes.splashPage,
        router: TrainingJournalRouter(),
        builder: (context, navigator) {
          return BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              if (state is AuthenticationUnauthenticated ||
                  state is AuthenticationLogInFailure) {
                ExtendedNavigator.root.pushAndRemoveUntil(
                  Routes.loginPage,
                  (route) => false,
                );
              } else if (state is AuthenticationAuthenticated) {
                ExtendedNavigator.root.pushAndRemoveUntil(
                  Routes.homePage,
                  (route) => false,
                );
              }
            },
            child: navigator,
          );
        },
      ),
    );
  }

  @override
  void initState() {
    BlocProvider.of<AuthenticationBloc>(context)
        .add(AuthenticationRefreshRequested());
    super.initState();
  }
}
