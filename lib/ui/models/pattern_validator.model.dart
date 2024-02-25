/// Modelo de Validador por RegEx
///   Parámetros:
///   * [pattern] RegEx
///   * [textError] Mensaje de error
class PatternValidator {
  String pattern;
  String textError;

  /// Crea una instancia de PatternValidator
  PatternValidator({
    required this.pattern,
    required this.textError,
  });
}
