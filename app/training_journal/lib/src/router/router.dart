import 'package:auto_route/auto_route_annotations.dart';
import 'package:training_journal/src/src.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: Home),
    MaterialRoute(page: LoginHome)
  ],
)
class $TrainingJournalRouter {}
