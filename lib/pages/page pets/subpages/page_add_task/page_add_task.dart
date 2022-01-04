import 'dart:convert';
import 'dart:ffi';

import 'package:app_pets/classes/task.dart';
import 'package:app_pets/stores/example/store_tasks.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/src/provider.dart';

import 'widgets/date_picker.dart';
import 'widgets/title_field.dart';

class PageAddTask extends StatefulWidget {
  const PageAddTask({Key? key}) : super(key: key);

  @override
  State<PageAddTask> createState() => _PageAddTaskState();
}

class _PageAddTaskState extends State<PageAddTask> {
  String? title;
  DateTime? date;

  void setDate(DateTime _date) {
    date = _date;
  }

  void setTitle(String _title) {
    title = _title;
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
      body: SingleChildScrollView(
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
                FractionallySizedBox(
                  widthFactor: 0.5,
                  child: DatePicker(
                    callback: setDate,
                  ),
                ),
                Container(height: 20),
                ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.add),
                      Text('ADICIONAR TAREFA'),
                    ],
                  ),
                  onPressed: submitForm,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
