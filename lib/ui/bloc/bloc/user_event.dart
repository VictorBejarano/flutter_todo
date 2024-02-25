part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class OnLogin extends UserEvent {
  final String user;
  final String password;

  const OnLogin({required this.user, required this.password});

  @override
  List<Object> get props => [user, password];
}
