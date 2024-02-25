import 'package:equatable/equatable.dart';

/// Endidad de usuario
///   Parámetros:
///   * [email] Correo electronico
///   * [password] Contraseña
///   * [isActive] Estado del usuario
class User extends Equatable {
  final String email;
  final String password;
  final bool isActive;

  /// Crea una instancia de User
  const User({
    required this.email,
    required this.password,
    required this.isActive,
  });

  /// Props de Equatable
  @override
  List<Object> get props => [
        email,
        password,
        isActive,
      ];
}
