import 'package:flutter/material.dart';
import 'package:flutter_todo/ui/pages/auth/auth_page.dart';
import 'package:flutter_todo/ui/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      initialRoute: AuthPage.route,
      routes: routes,
    );
  }
}
