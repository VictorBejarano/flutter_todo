import 'package:flutter/material.dart';
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

  Widget _selectPage() {
    return RefreshIndicator(
      onRefresh: _refreshData,
      child: ListView.builder(
        itemCount: temporalCounter,
        itemBuilder: (BuildContext context, int index) {
          return CardToDo(
            employeeName: 'Luis',
            title: 'Compra de mercado',
            endDate: DateTime.now(),
            state: TaskState.pending,
            onTap: () {
              Navigator.pushNamed(context, FormPage.route,
                  arguments: <String, dynamic>{
                    'mode': ModeForm.view,
                    'id': '123'
                  });
            },
          );
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
