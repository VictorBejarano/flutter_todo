import 'package:flutter/material.dart';

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
          return GestureDetector(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 24.0, horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('PEDRO'),
                        Text('PENDIENTE'),
                      ],
                    ),
                    Text('TAREA'),
                    Text('00/00/0000')
                  ],
                ),
              ),
            ),
            onTap: () {},
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
