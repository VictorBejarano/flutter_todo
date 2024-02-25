import 'package:flutter/material.dart';
import 'package:flutter_todo/ui/bloc/task/task_bloc.dart';
import 'package:flutter_todo/ui/pages/auth/auth_page.dart';
import 'package:flutter_todo/ui/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Clase app principal
class App extends StatelessWidget {
  const App({super.key});

  /// Metodo para construir el widget
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => TaskBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter ToDo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
        ),
        initialRoute: AuthPage.route,
        routes: routes,
      ),
    );
  }
}
