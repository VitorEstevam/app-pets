import 'dart:convert';
import 'dart:ffi';

import 'package:app_pets/classes/task.dart';
import 'package:app_pets/stores/example/store_tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:provider/src/provider.dart';

import 'widgets/date_picker.dart';
import 'widgets/period_selector.dart';
import 'widgets/pet_selector.dart';
import 'widgets/title_field.dart';

class PageAddTask extends StatefulWidget {
  const PageAddTask({Key? key}) : super(key: key);

  @override
  State<PageAddTask> createState() => _PageAddTaskState();
}

class _PageAddTaskState extends State<PageAddTask> {
  String? title;
  DateTime? date;
  String? pet;

  void setDateUnique(DateTime _date) {
    date = _date;
  }

  void setDateWeekly(DateTime _date) {
    // todo
  }

  void setDatePeriod(DateTime _date) {
    // todo
  }

  void setTitle(String _title) {
    title = _title;
  }

  void setPet(String _pet) {
    pet = _pet;
  }

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Task salva')),
      );
      var task = TaskUnique(title!, date!);
      context.read<StoreTasks>().insert(task);
      Future.delayed(
          const Duration(milliseconds: 800), () => {Navigator.pop(context)});
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text("Adicionar Tarefa"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: 20),
                    TitleField(
                      callback: setTitle,
                    ),
                    Container(height: 20),
                    PetSelector(
                      callback: (a) => {print(a)},
                      pets: const ["luke", "zelda", "pelor"],
                    ),
                    Container(height: 20),
                    Expanded(
                      child: PeriodSelector(
                        onSelectedUnique: setDateUnique,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: submitForm,
        child: const Icon(Icons.save),
      ),
    );
  }
}
