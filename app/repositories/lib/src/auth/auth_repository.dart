import 'dart:convert';

import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:http/http.dart' as http;
import 'package:repositories/src/auth/auth.dart';

const AUTH0_DOMAIN = 'training-journal.auth0.com';
const AUTH0_CLIENTID = 'oCjTMMDJP6w8ivjizi5i84Pcw5DRlnfo';

const AUTH0_REDIRECT_URI = 'io.training-journal://login-callback';
const AUTH0_ISSUER = 'https://$AUTH0_DOMAIN';

final FlutterAppAuth appAuth = FlutterAppAuth();

class AuthRepository {
  Future<User> getUserDetails(String accessToken) async {
    final url = 'https://$AUTH0_DOMAIN/userinfo';
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return User(
          email: json['email'], name: json['name'], photo: json['picture']);
    } else {
      throw Exception('change me to a typed exception');
    }
  }

  Map<String, dynamic> parseIdToken(String idToken) {
    final parts = idToken.split(r'.');
    assert(parts.length == 3);

    return jsonDecode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));
  }

  Future<Token> login() async {
    try {
      final AuthorizationTokenResponse result =
          await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(AUTH0_CLIENTID, AUTH0_REDIRECT_URI,
            issuer: 'https://$AUTH0_DOMAIN',
            scopes: ['openid', 'profile', 'offline_access'],
            promptValues: ['login']),
      );

      return Token(result.refreshToken, result.idToken, result.accessToken);
    } catch (e, s) {
      print('login error: $e - stack: $s');

      throw Exception('throw typed exception');
    }
  }

  Future<Token> refresh(String token) async {
    try {
      final result = await appAuth.token(
        TokenRequest(AUTH0_CLIENTID, AUTH0_REDIRECT_URI,
            issuer: AUTH0_ISSUER, refreshToken: token),
      );

      return Token(result.refreshToken, result.idToken, result.accessToken);
    } catch (e, s) {
      print('login error: $e - stack: $s');

      throw Exception('throw typed exception');
    }
  }
}
