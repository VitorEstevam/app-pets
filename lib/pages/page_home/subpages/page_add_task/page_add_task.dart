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
  Function? taskFactory;
  dynamic taskParam;
  String? pet;

  void setFrequency(Function factory,dynamic param){
    taskParam = param;
    taskFactory = factory;
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
        const SnackBar(
            content: Text('Task salva'), duration: Duration(milliseconds: 500)),
      );

      var task = taskFactory!(title,taskParam);
      context.read<StoreTasks>().insert(task);

      Future.delayed(
          const Duration(milliseconds: 500), () => {Navigator.pop(context)});
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
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                  PeriodSelector(setFrequency),
                ],
              ),
            ),
          )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: submitForm,
        label: const Text("SALVAR"),
        icon: const Icon(Icons.save),
      ),
    );
  }
}
