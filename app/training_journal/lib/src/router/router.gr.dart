// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../views.dart';

class Routes {
  static const String splashPage = '/';
  static const String homePage = '/home-page';
  static const String loginPage = '/login-page';
  static const String challengesPage = '/challenges-page';
  static const all = <String>{
    splashPage,
    homePage,
    loginPage,
    challengesPage,
  };
}

class TrainingJournalRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashPage, page: SplashPage),
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.loginPage, page: LoginPage),
    RouteDef(Routes.challengesPage, page: ChallengesPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SplashPage(),
        settings: data,
      );
    },
    HomePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomePage(),
        settings: data,
      );
    },
    LoginPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LoginPage(),
        settings: data,
      );
    },
    ChallengesPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ChallengesPage(),
        settings: data,
      );
    },
  };
}
