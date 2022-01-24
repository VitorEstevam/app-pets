import 'package:app_pets/classes/period_tuple.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PeriodPicker extends StatefulWidget {
  final void Function(PeriodTuple d) callback;
  const PeriodPicker({Key? key, required this.callback}) : super(key: key);

  @override
  State<PeriodPicker> createState() => _PeriodPickerState();
}

class _PeriodPickerState extends State<PeriodPicker> {
  List<PeriodTuple> periods = const [
    PeriodTuple('Diariamente', Duration(days: 1)),
    PeriodTuple('A cada 2 dias', Duration(days: 2)),
    PeriodTuple('A cada 3 dias', Duration(days: 3)),
    PeriodTuple('A cada 4 dias', Duration(days: 4)),
    PeriodTuple('A cada 5 dias', Duration(days: 5)),
    PeriodTuple('A cada 6 dias', Duration(days: 6)),
    PeriodTuple('Semanalmente', Duration(days: 7)),
  ];

  PeriodTuple? selectedPeriod;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrain) {
      return DropdownButtonFormField(
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: 'Selecione um período',
          border: OutlineInputBorder(),
        ),
        validator: (PeriodTuple? value) {
          if (value == null || value.label.isEmpty) {
            return 'Por favor, Selecione um período';
          }
          return null;
        },
        items: periods
            .map(
              (e) => DropdownMenuItem<PeriodTuple>(
                value: e,
                child: Text(e.label),
              ),
            )
            .toList(),
        onChanged: (PeriodTuple? _selected) {
          if (_selected != null) {
            selectedPeriod = _selected;
            widget.callback(_selected);
          }
        },
      );
    });
  }
}
