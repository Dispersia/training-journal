import 'package:equatable/equatable.dart';
import 'package:repositories/repositories.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationAuthenticated extends AuthenticationState {
  final Token token;

  const AuthenticationAuthenticated(this.token);

  @override
  List<Object> get props => [token];
}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationLoggingIn extends AuthenticationState {}

class AuthenticationLogInFailure extends AuthenticationState {}
