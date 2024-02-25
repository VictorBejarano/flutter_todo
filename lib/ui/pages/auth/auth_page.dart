import 'package:flutter/material.dart';
import 'package:flutter_todo/core/helpers/helpers.dart';
import 'package:flutter_todo/data/datasources/user_data_source.dart';
import 'package:flutter_todo/ui/models/models.dart';
import 'package:flutter_todo/ui/pages/auth/widgets/widgets.dart';
import 'package:flutter_todo/ui/pages/list_todo/list_todo_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  static const String route = '/';

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late BuildContext _context;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      body: _containerBox(),
    );
  }

  Widget _containerBox() {
    return Center(
        child: ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        padding: EdgeInsets.all(20.0),
        alignment: Alignment.center,
        constraints: const BoxConstraints(
          maxWidth: 400,
          maxHeight: 400,
        ),
        color: Colors.indigo,
        child: _authForm(),
      ),
    ));
  }

  Form _authForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          AuthInputForm(
            controller: _emailController,
            enabled: true,
            icon: Icons.account_box,
            obscureText: false,
            labelText: 'Email',
            textEmpty: 'ingrese un valor',
            withPattern: [
              PatternValidator(
                  pattern: r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  textError:
                      'Por favor, introduce un correo electrónico válido.')
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          AuthInputForm(
            enabled: true,
            controller: _passwordController,
            icon: Icons.lock,
            labelText: 'Contraseña',
            obscureText: true,
            textEmpty: 'Ingresa Contraseña',
            min: 8,
            withPattern: [
              PatternValidator(
                  pattern: r'[0-9]',
                  textError: 'La contraseña debe contener al menos un número.'),
              PatternValidator(
                  pattern: r'[A-Z]',
                  textError:
                      'La contraseña debe contener al menos una letra mayúscula.'),
              PatternValidator(
                  pattern: r'[!@#$%^&*(),.?":{}|<>]',
                  textError:
                      'La contraseña debe contener al menos un carácter especial.'),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: _onSubmit, child: const Text('INGRESAR')),
        ],
      ),
    );
  }

  void _onSubmit() async {
    try {
      if (_formKey.currentState!.validate()) {
        if (await UserDataSource.login(
            _emailController.text, _passwordController.text)) {
          if (!mounted) return;
          Navigator.pushReplacementNamed(_context, ListTodoPage.route);
        } else {
          if (!mounted) return;
          showSnackBarError(context, 'Usuario Inactivo');
        }
      }
    } catch (e) {
      if (!mounted) return;
      showSnackBarError(_context, e.toString());
    }
  }
}
