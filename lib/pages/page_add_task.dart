import 'dart:convert';

import 'package:app_pets/classes/task.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PageAddTask extends StatefulWidget {
  const PageAddTask({Key? key}) : super(key: key);

  @override
  State<PageAddTask> createState() => _PageAddTaskState();
}

class _PageAddTaskState extends State<PageAddTask> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController dateinput = TextEditingController();

  Task task = Task.unique();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
                TextFormField(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Título',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, preencha o título';
                    }
                    return null;
                  },
                  onFieldSubmitted: (String val) {
                    task.title = val;
                  },
                ),
                Container(height: 20),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Descrição',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, preencha a descrição';
                    }
                    return null;
                  },
                  onFieldSubmitted: (String val) {
                    task.description = val;
                  },
                ),
                Container(height: 20),
                FractionallySizedBox(
                  widthFactor: 0.5,
                  child: TextField(
                    controller: dateinput,
                    decoration: const InputDecoration(
                      labelText: "Data",
                      border: OutlineInputBorder(),
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2022),
                      );

                      if (pickedDate != null) {
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        setState(
                          () {
                            dateinput.text = formattedDate;
                            task.date = pickedDate;
                          },
                        );
                      }
                    },
                  ),
                ),
                Container(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                    print(json.encode(task));
                  },
                  child: FractionallySizedBox(
                    widthFactor: 1,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.add),
                          Text('ADICIONAR TAREFA'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
