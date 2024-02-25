import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_todo/core/helpers/helpers.dart';
import 'package:flutter_todo/data/datasources/user_data_source.dart';
import 'package:flutter_todo/ui/models/models.dart';
import 'package:flutter_todo/ui/pages/auth/widgets/widgets.dart';
import 'package:flutter_todo/ui/pages/list_todo/list_todo_page.dart';

///  Pagina de autenticación - [route] path de ruta.
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  static const String route = '/';

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  /// Contexto global
  late BuildContext _context;

  /// Variables para el formulario y obtencion de valores ingresados
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  /// Se ejecuta cuando el widget es destrido
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
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(child: _containerBox()),
    );
  }

  /// Validadores para el input de email por RegEx.
  List<PatternValidator> get _emailValidators {
    return [
      PatternValidator(
          pattern: r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
          textError: 'Por favor, introduce un correo electrónico válido.')
    ];
  }

  /// Validadores para el input de contraseña por RegEx.
  List<PatternValidator> get _passwordValidators {
    return [
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
    ];
  }

  /// Contenedor principal del logo y formulario
  Widget _containerBox() {
    return SingleChildScrollView(
        child: Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _drawLogoAndName(),
          const SizedBox(
            height: 20,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              alignment: Alignment.center,
              color: Colors.indigo,
              child: _authForm(),
            ),
          ),
        ],
      ),
    ));
  }

  /// Dibuja el logo de la app y el nombre
  Widget _drawLogoAndName() {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/images/logo.svg', //Logo en SVG
          width: 180, // Ruta de la imagen SVG en tu proyecto
        ),
        const Text(
          'FlutterTodo',
          style: TextStyle(
              color: Colors.indigo,
              fontFamily: 'Anta',
              fontSize: 40,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  /// Formulario de autenticacion
  Widget _authForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          _createEmailInput(),
          const SizedBox(
            height: 20,
          ),
          _createPasswordInput(),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: _onSubmit, child: const Text('INGRESAR')),
        ],
      ),
    );
  }

  /// Crea el input del email e implementa su validador
  Widget _createEmailInput() {
    return AuthInputForm(
      controller: _emailController,
      enabled: true,
      icon: Icons.account_box,
      obscureText: false,
      labelText: 'Email',
      textEmpty: 'ingrese un valor',
      withPattern: _emailValidators,
    );
  }

  /// Crea el input del password e implementa su validador
  Widget _createPasswordInput() {
    return AuthInputForm(
      enabled: true,
      controller: _passwordController,
      icon: Icons.lock,
      labelText: 'Contraseña',
      obscureText: true,
      textEmpty: 'Ingresa Contraseña',
      min: 8,
      withPattern: _passwordValidators,
    );
  }

  /// Envia los datos del formulario, redirecciona a la lista si es exitoso,
  /// de lo contrario muestra mensaje de error segun sea el caso
  void _onSubmit() async {
              if (!mounted) return;
          Navigator.pushReplacementNamed(_context, ListTodoPage.route);



    // try {
    //   if (_formKey.currentState!.validate()) {
    //     if (await UserDataSource.login(
    //         _emailController.text, _passwordController.text)) {
    //       if (!mounted) return;
    //       Navigator.pushReplacementNamed(_context, ListTodoPage.route);
    //     } else {
    //       if (!mounted) return;
    //       showSnackBarError(context, 'Usuario Inactivo');
    //     }
    //   }
    // } catch (e) {
    //   if (!mounted) return;
    //   showSnackBarError(_context, e.toString());
    // }
  }
}
