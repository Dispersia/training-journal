export 'router.gr.dart';

import 'package:auto_route/auto_route_annotations.dart';
import 'package:training_journal/src/views.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: HomePage),
    MaterialRoute(page: LoginPage),
    MaterialRoute(page: ChallengesPage),
    MaterialRoute(page: NineCPage)
  ],
)
class $TrainingJournalRouter {}
