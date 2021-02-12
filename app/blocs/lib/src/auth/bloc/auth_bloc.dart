import 'package:bloc/bloc.dart';
import 'package:blocs/src/auth/auth.dart';
import 'package:blocs/src/storage/storage.dart';
import 'package:meta/meta.dart';
import 'package:repositories/repositories.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository _authRepository;

  AuthenticationBloc({
    @required AuthRepository authRepository,
  })  : assert(authRepository != null),
        _authRepository = authRepository,
        super(AuthenticationUnauthenticated());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationLoginRequested) {
      yield* _mapAuthenticationLoginRequestedToState(event);
    } else if (event is AuthenticationLoggedIn) {
      yield await _mapAuthenticationLoggedInToState(event);
    } else if (event is AuthenticationLogoutRequested) {
      yield await _mapAuthenticationLogoutRequestedToState(event);
    } else if (event is AuthenticationRefreshRequested) {
      yield* _mapAuthenticationRefreshToState(event);
    }
  }

  Stream<AuthenticationState> _mapAuthenticationLoginRequestedToState(
    AuthenticationLoginRequested event,
  ) async* {
    try {
      yield AuthenticationLoggingIn();
      final token = await _authRepository.login();
      add(AuthenticationLoggedIn(token));
    } catch (e, s) {
      print('Exception: $e, Stack Trace: $s');
      yield AuthenticationLogInFailure();
    }
  }

  Future<AuthenticationState> _mapAuthenticationLoggedInToState(
    AuthenticationLoggedIn event,
  ) async {
    if (event.token.refreshToken != null) {
      await secureStorage.write(
          key: 'refresh_token', value: event.token.refreshToken);
    }
    return AuthenticationAuthenticated(event.token);
  }

  Future<AuthenticationState> _mapAuthenticationLogoutRequestedToState(
    AuthenticationLogoutRequested event,
  ) async {
    await secureStorage.delete(key: 'refresh_token');
    return AuthenticationUnauthenticated();
  }

  Stream<AuthenticationState> _mapAuthenticationRefreshToState(
    AuthenticationRefreshRequested event,
  ) async* {
    final refreshToken = await secureStorage.read(key: 'refresh_token');
    if (refreshToken == null) {
      yield AuthenticationUnauthenticated();
      return;
    }

    try {
      yield AuthenticationLoggingIn();
      final token = await _authRepository.refresh(refreshToken);
      add(AuthenticationLoggedIn(token));
    } catch (e, s) {
      print('Exception: $e, stack: $s');
      yield AuthenticationLogInFailure();
    }
  }
}
