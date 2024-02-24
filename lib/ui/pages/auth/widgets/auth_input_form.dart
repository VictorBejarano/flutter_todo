part of 'widgets.dart';

class AuthInputForm extends StatelessWidget {
  final bool enabled;
  final TextEditingController controller;
  final IconData icon;
  final String labelText;
  final bool obscureText;
  final String textEmpty;
  final List<PatternValidator>? withPattern;
  final int? min;

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
