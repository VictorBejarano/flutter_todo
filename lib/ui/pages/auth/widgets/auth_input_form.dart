part of 'widgets.dart';

/// Widget del input standar para el login
///   Parámetros:
///   * [enabled] El input esta habilitado.
///   * [controller] Controlador del input.
///   * [icon] Icono posterior.
///   * [labelText] Texto del label.
///   * [obscureText] Si se oculta el texto ingresado.
///   * [textEmpty] Mensaje a mostrar cuando el validador requerido no se cumple.
///   * [withPattern] Validadores con RegEx.
///   * [min] Caracteres minimos.
class AuthInputForm extends StatelessWidget {
  final bool enabled;
  final TextEditingController controller;
  final IconData icon;
  final String labelText;
  final bool obscureText;
  final String textEmpty;
  final List<PatternValidator>? withPattern;
  final int? min;

  /// Constructor del widget AuthInputForm
  /// [enabled], [controller], [icon], [labelText], [obscureText] y [textEmpty] son requeridos,
  /// [withPattern] y [min] son opcionales
  const AuthInputForm(
      {super.key,
      required this.enabled,
      required this.controller,
      required this.icon,
      required this.labelText,
      required this.obscureText,
      required this.textEmpty,
      this.withPattern,
      this.min});

  /// Metodo para construir el widget
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      obscureText: obscureText,
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        labelText: labelText,
        suffixIcon: Icon(icon),
      ),
      validator: _validation,
    );
  }

  /// Funcion para generar la validacion sobre el input
  String? _validation(String? value) {
    if (value == null || value.isEmpty) {
      return textEmpty;
    }

    if (min != null) {
      if (value.length < min!) {
        return 'La contraseña debe tener al menos $min caracteres.';
      }
    }

    if (withPattern != null) {
      for (var item in withPattern!) {
        final emailRegExp = RegExp(item.pattern);
        if (!emailRegExp.hasMatch(value)) {
          return item.textError;
        }
      }
    }

    return null;
  }
}
