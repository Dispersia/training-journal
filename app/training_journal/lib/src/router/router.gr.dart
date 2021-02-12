// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../src.dart';

class Routes {
  static const String splashPage = '/';
  static const String home = '/Home';
  static const String loginHome = '/login-home';
  static const all = <String>{
    splashPage,
    home,
    loginHome,
  };
}

class TrainingJournalRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashPage, page: SplashPage),
    RouteDef(Routes.home, page: Home),
    RouteDef(Routes.loginHome, page: LoginHome),
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
    Home: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const Home(),
        settings: data,
      );
    },
    LoginHome: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LoginHome(),
        settings: data,
      );
    },
  };
}
