import 'package:async_redux/async_redux.dart';
import 'package:plantpedia/src/redux/states/app_state.dart';

class AuthViewModel {
  final String token;
  final dynamic user;

  AuthViewModel({
    this.token,
    this.user,
  });

  factory AuthViewModel.build(Store<AppState> store) {
    final authState = store.state.authState;

    return AuthViewModel(
      token: authState.token,
      user: authState.user,
    );
  }
}
