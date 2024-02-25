import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/data/models/models.dart';
import 'package:flutter_todo/ui/bloc/task/task_bloc.dart';
import 'package:flutter_todo/ui/models/models.dart';
import 'package:flutter_todo/ui/pages/form/form_page.dart';
import 'package:flutter_todo/ui/pages/list_todo/widgets/widgets.dart';
import 'package:flutter_todo/ui/pages/widgets/widgets.dart';

///  Pagina de Listado de tareas - [route] path de ruta.
class ListTodoPage extends StatefulWidget {
  const ListTodoPage({super.key});

  static String route = 'list-todo';

  @override
  State<ListTodoPage> createState() => _ListTodoPageState();
}

/// Clase estado de ListTodoPage
class _ListTodoPageState extends State<ListTodoPage> {
  /// Se ejecuta cuando el widget se inicia
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TaskBloc>(context).getTasks();
  }

  /// Metodo para construir el widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarTodo(
        title: 'Lista de tareas',
      ),
      body: _listTasks(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, FormPage.route,
              arguments: <String, dynamic>{'mode': ModeForm.create});
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  /// Crea el componente con indicador de actualizacion y bloc
  Widget _listTasks() {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          return _switchState(state);
        },
      ),
    );
  }

  /// Condiciones para visualizar mensajes y listado de tareas
  Widget _switchState(TaskState state) {
    switch (state) {
      case GetTaskInProgress():
        return _textMessageContainer(
            message: '...Cargando', color: Colors.indigo);
      case GetTaskSuccess():
        List<TaskModel> list = state.dictionary.values.toList();
        if (list.isNotEmpty) {
          return _createListBuilder(list);
        }
        return _textMessageContainer(
            message: 'No hay tareas',
            color: Colors.indigo,
            child: IconButton(
                onPressed: _refreshData,
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.indigo,
                )));
      case GetTaskError():
        return _textMessageContainer(
            message: state.messageError, color: Colors.red);
      default:
        return const Text('Error en cambio de estado');
    }
  }

  /// Crea el ListView.builder
  Widget _createListBuilder(List<TaskModel> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        final task = list[index];
        return _createCardTodo(task);
      },
    );
  }

  /// Crea el estandar para las tarjetas de las tareas
  Widget _createCardTodo(TaskModel task) {
    return CardToDo(
      employeeName: task.employeeName,
      title: task.title,
      endDate: task.endDate,
      state: task.state,
      onTap: () {
        Navigator.pushNamed(context, FormPage.route,
            arguments: <String, dynamic>{'mode': ModeForm.view, 'id': task.id});
      },
    );
  }

  /// Contenedor de mensajes a visualizar
  Widget _textMessageContainer(
      {required String message, required Color color, Widget? child}) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: TextStyle(
                  color: color, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            (child != null) ? child : const SizedBox.shrink()
          ],
        )));
  }

  /// Actualiza los datos a partir del estado en bloc
  Future<void> _refreshData() async {
    setState(() {
      BlocProvider.of<TaskBloc>(context).getTasks();
    });
  }
}
