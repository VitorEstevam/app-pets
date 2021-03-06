import 'dart:convert';
// import 'dart:ffi';

import 'package:app_pets/classes/tasks/task.dart';
import 'package:app_pets/consts/utils.dart';
import 'package:app_pets/stores/pets/store_pets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';

import 'widgets/date_picker.dart';
import 'widgets/period_selector.dart';
import 'widgets/pet_selector.dart';
import 'widgets/title_field.dart';

class PageAddTask extends StatefulWidget {
  final String? title;
  const PageAddTask({Key? key, this.title}) : super(key: key);

  @override
  State<PageAddTask> createState() => _PageAddTaskState();
}

class _PageAddTaskState extends State<PageAddTask> {
  String? title;
  Function? taskFactory;
  dynamic taskParam;
  String? petName;
  int selectedPet = 0;

  @override
  void initState() {
    // TODO: implement initState
    title = widget.title;
    super.initState();
  }

  void setFrequency(Function factory, dynamic param) {
    taskParam = param;
    taskFactory = factory;
  }

  void setTitle(String _title) {
    title = _title;
  }

  void setPet(String _pet) {
    petName = _pet;
  }

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      var pet = context.read<StorePets>().getPetByName(petName);
      var task = taskFactory!(title, pet, taskParam);

      context.read<StorePets>().addNewTaskToPet(pet, task);
      saveState(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Task salva'), duration: Duration(milliseconds: 500)),
      );
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
        title: const Text("Adicionar tarefa"),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 20),
                  TitleField(
                    initialValue: title ?? "",
                    callback: setTitle,
                  ),
                  Container(height: 20),
                  PetSelector(
                    callback: (name) => {setPet(name)},
                    pets: Provider.of<StorePets>(context)
                        .getPetNames(), // const ["luke", "zelda", "pelor"],
                  ),
                  Container(height: 20),
                  PeriodSelector(setFrequency),
                  Container(height: 20),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                        onPressed: () => submitForm(),
                        child: Center(
                          child: Container(
                            width: double.infinity,
                            height: 40,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Icon(Icons.add),
                                  Text('ADICIONAR TAREFA')
                                ],
                              ),
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
