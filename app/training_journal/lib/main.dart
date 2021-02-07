import 'package:flutter/material.dart';
import 'package:repositories/repositories.dart';
import 'package:training_journal/app.dart';

void main() {
  return runApp(
    App(
      authRepository: AuthRepository(),
    ),
  );
}
