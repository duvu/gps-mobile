import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:ng_client/src/resources/authentication/authentication.dart';
import 'package:ng_client/src/resources/repositories/authentication_repository.dart';
import 'package:ng_client/src/ui/home/home.dart';
import 'package:ng_client/src/ui/splash/splash.dart';
import 'resources/authentication/authentication_bloc.dart';
import 'common/common.dart';
import 'ui/login/login_page.dart';


class App extends StatelessWidget {
  final AuthenticationRepository authRepository;

  App({Key key, @required this.authRepository}) : super(key: key) {
    print(GlobalConfiguration().get("SERVER_URL"));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state)
    {
      if (state is AuthenticationAuthenticated) {
        return HomePage();
      }
      if (state is AuthenticationUnauthenticated) {
        return LoginPage(authRepository: authRepository);
      }
      if (state is AuthenticationLoading) {
        return LoadingIndicator();
      }
      return SplashPage();
    }
        )
    );
  }

}


class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}