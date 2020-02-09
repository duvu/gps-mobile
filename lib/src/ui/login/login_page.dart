import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ng_client/src/resources/authentication/authentication_bloc.dart';
import 'package:ng_client/src/resources/repositories/authentication_repository.dart';

import 'bloc/login_bloc.dart';
import 'login_form.dart';

class LoginPage extends StatelessWidget {
  final AuthenticationRepository authRepository;

  LoginPage({Key key, @required this.authRepository})
      : assert(authRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: BlocProvider(
          create: (context) {
            return LoginBloc(
              authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
              authRepository: authRepository,
            );
          },
          child: LoginForm(),
        ),
      )
    );
  }
}
