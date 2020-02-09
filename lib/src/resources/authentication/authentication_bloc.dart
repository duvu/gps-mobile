import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:ng_client/src/resources/authentication/authentication.dart';
import 'package:ng_client/src/resources/repositories/authentication_repository.dart';



class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authRepository;

  AuthenticationBloc({@required this.authRepository})
      : assert(authRepository != null);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if (event is AppStarted) {
      final bool hasToken = await authRepository.hasToken();

      if (hasToken) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await authRepository.persistToken(event.token);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await authRepository.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }
}
