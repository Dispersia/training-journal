import 'package:equatable/equatable.dart';
import 'package:repositories/repositories.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationLoginRequested extends AuthenticationEvent {}

class AuthenticationLoggedIn extends AuthenticationEvent {
  final Token token;

  const AuthenticationLoggedIn(this.token);

  @override
  List<Object> get props => [token];
}

class AuthenticationLoginFailed extends AuthenticationEvent {}

class AuthenticationLogoutRequested extends AuthenticationEvent {}

class AuthenticationRefreshRequested extends AuthenticationEvent {}
