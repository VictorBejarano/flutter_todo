part of 'widgets.dart';

class AppBarTodo extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  const AppBarTodo({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueAccent,
      title: Text(title),
      scrolledUnderElevation: 2,
      shadowColor: Theme.of(context).colorScheme.shadow,
    );
  }
}
