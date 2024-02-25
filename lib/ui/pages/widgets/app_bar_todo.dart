part of 'widgets.dart';

///  Widget global de la barra de navegacion personalizada.
///   Parámetros:
///   * [title] Titulo a mostrar.
class AppBarTodo extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  /// Constructor del widget AppBarTodo
  /// [title] es requerido,
  const AppBarTodo({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  /// Metodo para construir el widget
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.indigo,
      title: Text(title),
      scrolledUnderElevation: 2,
      shadowColor: Theme.of(context).colorScheme.shadow,
    );
  }
}
