import 'dart:async';

import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:ng_client/src/resources/authentication/authentication_bloc.dart';
import 'package:ng_client/src/resources/authentication/authentication.dart';
import 'package:ng_client/src/resources/repositories/authentication_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepository authRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.authRepository,
    @required this.authenticationBloc,
  })  : assert(authRepository != null),
        assert(authenticationBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final auth = await authRepository.authenticate(
          username: event.username,
          password: event.password,
        );

        if (auth.access_token != null) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("token", auth.access_token);
          prefs.setInt('expires_in', auth.expires_in);
          prefs.setStringList('authorities', auth.authorities);

          authenticationBloc.add(LoggedIn(token: auth.access_token));
          yield LoginInitial();
        } else {
          yield LoginFailure(error: 'Not able to login!');
        }
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
