part of 'widgets.dart';

///  Widget tarjeta de la tarea.
///   Parámetros:
///   * [employeeName] El nombre del empleado.
///   * [title] El titulo de la tarea.
///   * [endDate] Fecha de entrega.
///   * [state] estado de la tarea.
///   * [opTap] evento tap.
class CardToDo extends StatelessWidget {
  final String employeeName;
  final String title;
  final String endDate;
  final TaskStateEnum state;
  final Function() onTap;

  /// Constructor del widget CardToDo
  /// [employeeName], [title], [endDate], [state] y [opTap] son requeridos.
  const CardToDo(
      {super.key,
      required this.employeeName,
      required this.title,
      required this.endDate,
      required this.state,
      required this.onTap});

  /// Metodo para construir el widget
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade200,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: _dataText(),
        ),
      ),
    );
  }

  /// Metodo para mostrar la informacion basica de la tarjeta
  Widget _dataText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(employeeName),
            _showTextState(),
          ],
        ),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        _dateText()
      ],
    );
  }

  /// Metodo para mostrar y formatear la fecha de entrega
  Widget _dateText() {
    return RichText(
        text: TextSpan(
      text: 'Fecha de entrega: ',
      style:
          TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade900),
      children: <TextSpan>[
        TextSpan(
            text: endDate,
            style: const TextStyle(fontWeight: FontWeight.normal)),
      ],
    ));
  }

  /// Metodo para visualizar el estado de la tarea por colores
  Text _showTextState() {
    switch (state) {
      case TaskStateEnum.pending:
        return const Text(
          'PENDIENTE',
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
        );
      case TaskStateEnum.inProgress:
        return const Text(
          'EN PROGRESO',
          style: TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
        );
      case TaskStateEnum.complete:
        return const Text(
          'COMPLETADO',
          style:
              TextStyle(color: Colors.lightGreen, fontWeight: FontWeight.bold),
        );
      default:
        return const Text(
          'ERROR',
          style:
              TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
        ); // Sale cuando la tarea no tiene un estado dando error.
    }
  }
}
