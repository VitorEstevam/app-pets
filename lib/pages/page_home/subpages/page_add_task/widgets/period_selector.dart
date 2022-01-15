import 'package:app_pets/classes/tasks/task.dart';
import 'package:app_pets/classes/tasks/task_unique.dart';
import 'package:app_pets/pages/page_home/subpages/page_add_task/widgets/date_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PeriodSelector extends StatefulWidget {
  final Function(Function factory, dynamic param) onPeriodSubmit;

  const PeriodSelector(
    this.onPeriodSubmit, {
    Key? key,
  }) : super(key: key);

  @override
  State<PeriodSelector> createState() => _PeriodSelectorState();
}

class _PeriodSelectorState extends State<PeriodSelector> {
  var isSelected = [true, false, false];

  void submitTaskUnique(DateTime dt) {
    var _factory = (String a, dynamic b) => TaskUnique(a, b);
    widget.onPeriodSubmit(_factory, dt);
  }

  Widget getBody() {
    if (isSelected[0]) {
      return DatePicker(
        callback: (a) => submitTaskUnique(a),
      );
    }
    if (isSelected[1]) return Container();
    if (isSelected[2]) return Container();
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Frequência",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 15,
          ),
          ToggleButtons(
            constraints:
                BoxConstraints.expand(width: constraints.maxWidth / 3 - 2),
            borderRadius: BorderRadius.circular(3.0),
            borderColor: Theme.of(context).primaryColor,
            selectedBorderColor: Theme.of(context).primaryColor,
            textStyle: const TextStyle(fontWeight: FontWeight.w500),
            selectedColor: Colors.white,
            fillColor: Theme.of(context).primaryColor,
            children: const <Widget>[
              Text("ÚNICA"),
              Text("SEMANAL"),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Text("PERIÓDICA"),
              ),
            ],
            onPressed: (int index) {
              setState(
                () {
                  for (int buttonIndex = 0;
                      buttonIndex < isSelected.length;
                      buttonIndex++) {
                    if (buttonIndex == index) {
                      isSelected[buttonIndex] = true;
                    } else {
                      isSelected[buttonIndex] = false;
                    }
                  }
                },
              );
            },
            isSelected: isSelected,
          ),
          Container(
            height: 15,
          ),
          Container(
            child: getBody(),
          )
        ],
      );
    });
  }
}
