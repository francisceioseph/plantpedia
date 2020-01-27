class AuthState {
  final String token;
  final dynamic user;

  AuthState({this.token, this.user});

  AuthState copy({
    final String token,
    final dynamic user,
  }) {
    return AuthState(
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }

  factory AuthState.initialState() => AuthState(
        token: '',
        user: null,
      );
}
