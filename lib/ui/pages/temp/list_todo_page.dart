import 'package:flutter/material.dart';
import 'package:flutter_todo/ui/models/models.dart';
import 'package:flutter_todo/ui/pages/temp/widgets/widgets.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Lista de tareas'),
        scrolledUnderElevation: 2,
        shadowColor: Theme.of(context).colorScheme.shadow,
      ),
      body: _selectPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
              print('object');
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
