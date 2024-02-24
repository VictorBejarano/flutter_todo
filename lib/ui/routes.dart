import 'package:flutter/material.dart';
import 'package:flutter_todo/ui/pages/auth/auth_page.dart';
import 'package:flutter_todo/ui/pages/temp/list_todo_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AuthPage.route: (_) => AuthPage(),
  ListTodoPage.route: (_) => ListTodoPage(),
};
