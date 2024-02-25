import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/data/models/models.dart';
import 'package:flutter_todo/ui/bloc/task/task_bloc.dart';
import 'package:flutter_todo/ui/models/models.dart';
import 'package:flutter_todo/ui/pages/widgets/widgets.dart';
import 'package:intl/intl.dart';

///  Pagina de formulario - [route] path de ruta.
class FormPage extends StatefulWidget {
  const FormPage({super.key});

  static const String route = 'form';

  @override
  State<FormPage> createState() => _FormPageState();
}

/// Clase estado de FormPage
class _FormPageState extends State<FormPage> {
  ModeForm? _mode;
  late String _id;
  late String _dropdownValue;
  final _formKey = GlobalKey<FormState>();

  /// Controladores de los inputs
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _employeeNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _observationsController = TextEditingController();

  ///Se ejecuta cuando el estado cambia
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_mode == null) {
      // Condicion para que cuando se ejecuta [setState] no reinicialice [_mode]
      _mode = (ModalRoute.of(context)!.settings.arguments
          as Map<String, dynamic>)['mode'];
      if (_mode == ModeForm.view) {
        _setDataToEdit();
      }
    }
  }

  /// Se ejecuta cuando el widget es destruido
  @override
  void dispose() {
    _titleController.dispose();
    _employeeNameController.dispose();
    _dateController.dispose();
    _observationsController.dispose();
    super.dispose();
  }

  /// Metodo para construir el widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBarTodo(
        title: _getTitleAppBar(_mode),
      ),
      floatingActionButton: _createFloatingActionButtons(),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: _createForm(context),
      ),
    );
  }

  /// Crea el formulario
  Widget _createForm(BuildContext context) {
    return Form(
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
              (_mode == ModeForm.edit)
                  ? _createDropDown()
                  : const SizedBox.shrink(),
              (_mode == ModeForm.edit)
                  ? const SizedBox(
                      height: 20,
                    )
                  : const SizedBox.shrink(),
              (_mode == ModeForm.create)
                  ? ElevatedButton(
                      onPressed: _onSubmitCreate,
                      child: const Text('CREAR TAREA'))
                  : const SizedBox.shrink(),
              (_mode == ModeForm.edit)
                  ? ElevatedButton(
                      onPressed: _onSubmitEdit,
                      child: const Text('EDITAR TAREA'))
                  : const SizedBox.shrink(),
              (_mode == ModeForm.view)
                  ? ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<TaskBloc>(context).deleteTask(_id);
                        Navigator.pop(context);
                      },
                      child: const Text('ELIMINAR'))
                  : const SizedBox.shrink()
            ],
          ),
        ));
  }

  /// Crea el input del titulo
  Widget _createInputTitle() {
    return TextFormField(
      enabled: _mode != ModeForm.view,
      controller: _titleController,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
        labelText: 'Titulo',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'El valor es requerido';
        }
        return null;
      },
    );
  }

  /// Crea el input del nombre empleado
  Widget _createInputEmployeeName() {
    return TextFormField(
      enabled: _mode != ModeForm.view,
      controller: _employeeNameController,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      decoration: const InputDecoration(
        labelText: 'Nombre del empleado',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'El valor es requerido';
        }
        return null;
      },
    );
  }

  /// Crea el date picker para fecha de entrega
  Widget _createInputEndDate(BuildContext context) {
    return TextFormField(
      enabled: _mode != ModeForm.view,
      controller: _dateController,
      keyboardType: TextInputType.datetime,
      decoration: const InputDecoration(
        labelText: 'Fecha de entrega',
      ),
      readOnly: true,
      onTap: _createDatePickerForm,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'El valor es requerido';
        }
        return null;
      },
    );
  }

  /// Crea el input de observaciones
  Widget _createInputObservations() {
    return TextFormField(
      enabled: _mode != ModeForm.view,
      controller: _observationsController,
      keyboardType: TextInputType.multiline,
      textCapitalization: TextCapitalization.sentences,
      maxLines: null,
      decoration: const InputDecoration(
        alignLabelWithHint: true,
        labelText: 'Observaciones',
        border: OutlineInputBorder(),
      ),
      minLines: 8,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'El valor es requerido';
        }
        return null;
      },
    );
  }

  /// Crea el input dropdown de estado
  Widget _createDropDown() {
    final List<String> dropdownItems = [
      'Pendiente',
      'En progreso',
      'Completado'
    ];
    return DropdownButtonFormField(
      value: _dropdownValue,
      items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? value) {
        _dropdownValue = value!;
      },
    );
  }

  /// Crea el boton editar
  Widget? _createFloatingActionButtons() {
    return (_mode == ModeForm.view)
        ? FloatingActionButton(
            onPressed: () {
              setState(() {
                _mode = ModeForm.edit;
              });
            },
            child: const Icon(Icons.edit),
          )
        : null;
  }

  /// Crea el date picker
  Future<void> _createDatePickerForm() async {
    DateTime? picker = await showDatePicker(
        context: context,
        keyboardType: TextInputType.datetime,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (picker != null) {
      _dateController.text = DateFormat('dd/MM/yyyy').format(picker);
    }
  }

  /// Retorna el titulo del boton a partir del enum [ModeForm]
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

  /// Retorna el nombre del estado a partir del enum [TaskStateEnum]
  String _getStateFromEnum(TaskStateEnum value) {
    switch (value) {
      case TaskStateEnum.pending:
        return 'Pendiente';
      case TaskStateEnum.inProgress:
        return 'En progreso';
      case TaskStateEnum.complete:
        return 'Completado';
      default:
        return 'ERROR';
    }
  }

  /// Retorna el valor del enum del estado a partir del texto [value]
  TaskStateEnum _getEnumFromState(String value) {
    switch (value) {
      case 'Pendiente':
        return TaskStateEnum.pending;
      case 'En progreso':
        return TaskStateEnum.inProgress;
      case 'Completado':
        return TaskStateEnum.complete;
      default:
        return TaskStateEnum.pending;
    }
  }

  /// Inicializa las variables cuando se edita la tarea
  void _setDataToEdit() {
    _id = (ModalRoute.of(context)!.settings.arguments
        as Map<String, dynamic>)['id'];
    final task = BlocProvider.of<TaskBloc>(context).state.dictionary[_id];
    _titleController.text = task!.title;
    _employeeNameController.text = task.employeeName;
    _dateController.text = task.endDate;
    _observationsController.text = task.observations;
    _dropdownValue = _getStateFromEnum(task.state);
  }

  /// Funcion enviar datos en modo crear
  void _onSubmitCreate() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<TaskBloc>(context).createTask(TaskModel(
          id: '',
          title: _titleController.text,
          employeeName: _employeeNameController.text,
          endDate: _dateController.text,
          observations: _observationsController.text,
          state: TaskStateEnum.pending));
      Navigator.pop(context);
    }
  }

  /// Funcion enviar datos en modo editar
  void _onSubmitEdit() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<TaskBloc>(context).editTask(TaskModel(
          id: _id,
          title: _titleController.text,
          employeeName: _employeeNameController.text,
          endDate: _dateController.text,
          observations: _observationsController.text,
          state: _getEnumFromState(_dropdownValue)));
      Navigator.pop(context);
    }
  }
}
