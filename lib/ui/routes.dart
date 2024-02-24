import 'package:flutter/material.dart';
import 'package:flutter_todo/ui/pages/auth/auth_page.dart';
import 'package:flutter_todo/ui/pages/form/form_page.dart';
import 'package:flutter_todo/ui/pages/list_todo/list_todo_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AuthPage.route: (_) => AuthPage(),
  ListTodoPage.route: (_) => ListTodoPage(),
  FormPage.route: (_) => FormPage(),
};
