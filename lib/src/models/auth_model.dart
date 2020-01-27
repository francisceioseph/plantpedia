import 'package:equatable/equatable.dart';

class AuthModel extends Equatable {
  final String token;
  final dynamic user;

  AuthModel({this.token, this.user});

  @override
  List<Object> get props => [token, user];
}
