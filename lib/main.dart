import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:ng_client/src/app.dart';
import 'package:ng_client/src/resources/authentication/authentication_bloc.dart';
import 'package:ng_client/src/resources/authentication/authentication.dart';
import 'package:ng_client/src/resources/repositories/authentication_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromAsset("app_settings");
  final authRepository = AuthenticationRepository();

  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(
      BlocProvider<AuthenticationBloc>(
        create: (context) {
          return AuthenticationBloc(authRepository: authRepository)
              ..add(AppStarted());
        },
        child: App(authRepository: authRepository),
      ));
}