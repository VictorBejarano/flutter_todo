import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/data/models/models.dart';
import 'package:flutter_todo/ui/bloc/task/task_bloc.dart';
import 'package:flutter_todo/ui/models/models.dart';
import 'package:flutter_todo/ui/pages/form/form_page.dart';
import 'package:flutter_todo/ui/pages/list_todo/widgets/widgets.dart';
import 'package:flutter_todo/ui/pages/widgets/widgets.dart';

class ListTodoPage extends StatefulWidget {
  const ListTodoPage({super.key});

  static const String route = 'temporal';

  @override
  State<ListTodoPage> createState() => _ListTodoPageState();
}

class _ListTodoPageState extends State<ListTodoPage> {
  int temporalCounter = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarTodo(
        title: 'Lista de tareas',
      ),
      body: _selectPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, FormPage.route,
              arguments: <String, dynamic>{'mode': ModeForm.create});
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<TaskBloc>(context).getTasks();
  }

  Widget _selectPage() {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          switch (state) {
            case GetTaskInProgress():
              return const Text('...Cargando');
            case GetTaskSuccess():
              List<TaskModel> list = state.dictionary.values.toList();
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) {
                  final task = list[index];
                  return CardToDo(
                    employeeName: task.employeeName,
                    title: task.title,
                    endDate: task.endDate,
                    state: task.state,
                    onTap: () {
                      Navigator.pushNamed(context, FormPage.route,
                          arguments: <String, dynamic>{
                            'mode': ModeForm.view,
                            'id': task.id
                          });
                    },
                  );
                },
              );
            case GetTaskError():
              return Text(state.messageError);
            default:
              return const Text('Error en cambio de estado');
          }
        },
      ),
    );
  }

  Future<void> _refreshData() async {
    setState(() {
      temporalCounter = 5;
    });
    print('Test');
  }
}
