import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String email;
  final String password;
  final bool isActive;

  const User({
    required this.email,
    required this.password,
    required this.isActive,
  });

  @override
  List<Object> get props => [
        email,
        password,
        isActive,
      ];
}
