import 'package:flutter/material.dart';
import 'package:flutter_todo/ui/models/models.dart';
import 'package:flutter_todo/ui/pages/widgets/widgets.dart';
import 'package:intl/intl.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  static const String route = 'form';

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _employeeNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _observationsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ModeForm mode = (ModalRoute.of(context)!.settings.arguments
        as Map<String, dynamic>)['mode'];
    // final String id = (ModalRoute.of(context)!.settings.arguments
    //     as Map<String, dynamic>)['id'];
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBarTodo(
        title: _getTitleAppBar(mode),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _createInputTitle(),
                  const SizedBox(
                    height: 10,
                  ),
                  _createInputEmployeeName(),
                  const SizedBox(
                    height: 10,
                  ),
                  _createInputEndDate(context),
                  const SizedBox(
                    height: 20,
                  ),
                  _createInputObservations(),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: _onSubmit, child: const Text('CREAR TAREA')),
                ],
              ),
            )),
      ),
    );
  }

  void _onSubmit() {
    print('Temporal');
  }

  TextFormField _createInputObservations() {
    return TextFormField(
      controller: _observationsController,
      keyboardType: TextInputType.multiline,
      textCapitalization: TextCapitalization.sentences,
      maxLines: null,
      decoration: const InputDecoration(
        labelText: 'Observaciones',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _createInputEndDate(BuildContext context) {
    return TextFormField(
      controller: _dateController,
      keyboardType: TextInputType.datetime,
      decoration: const InputDecoration(
        labelText: 'Fecha de entrega',
      ),
      readOnly: true,
      onTap: () async {
        DateTime? picker = await showDatePicker(
            context: context,
            keyboardType: TextInputType.datetime,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100));
        if (picker != null) {
          _dateController.text = DateFormat('dd/MM/yyyy').format(picker);
        }
      },
    );
  }

  Widget _createInputEmployeeName() {
    return TextFormField(
      controller: _employeeNameController,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
        labelText: 'Nombre del empleado',
      ),
    );
  }

  Widget _createInputTitle() {
    return TextFormField(
      controller: _titleController,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
        labelText: 'Titulo',
      ),
    );
  }

  String _getTitleAppBar(ModeForm? mode) {
    switch (mode) {
      case ModeForm.create:
        return 'Crear tarea';
      case ModeForm.edit:
        return 'Editar tarea';
      case ModeForm.view:
        return 'Ver tarea';
      default:
        return 'ERROR';
    }
  }
}
