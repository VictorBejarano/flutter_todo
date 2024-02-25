import 'package:flutter/material.dart';
import 'package:flutter_todo/ui/pages/auth/auth_page.dart';
import 'package:flutter_todo/ui/pages/form/form_page.dart';
import 'package:flutter_todo/ui/pages/list_todo/list_todo_page.dart';

/// Rutas de la aplicacion
Map<String, Widget Function(BuildContext)> routes = {
  AuthPage.route: (_) => const AuthPage(),
  ListTodoPage.route: (_) => const ListTodoPage(),
  FormPage.route: (_) => const FormPage(),
};
