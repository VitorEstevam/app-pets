import 'package:app_pets/classes/pet.dart';
import 'package:app_pets/pages/page_pet/widgets/choose_circle_color.dart';
import 'package:app_pets/pages/page_pet/widgets/color_selector.dart';
import 'package:app_pets/pages/tab_bar_handler.dart';
import 'package:app_pets/stores/example/store_global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/icon_selector.dart';

class CreatePetIntro extends StatelessWidget {
  String? name;
  String? image;
  Color? color;
  final _formKey = GlobalKey<FormState>();

  void chooseIcon(String stringUrl) {
    print(stringUrl);
    image = stringUrl;
  }

  void chooseColor(Color color) {
    color = color;
  }

  void chooseName(String name) {
    name = name;
  }

  void createAnimal(BuildContext context) {
    Provider.of<StoreGlobal>(context, listen: false)
        .addNewPet(Pet(name!, image!, color!));

    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const TabBarHandler()));
  }

  void submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      print("válido");
      createAnimal(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("nome do app"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 20),
                IconSelector(onSelect: chooseIcon),
                Container(height: 20),
                ColorSelector(onSelect: chooseColor),
                Container(height: 20),
                TextInput(
                  onChanged: chooseName,
                  validator: (_) {
                    if (name == null || name == "") {
                      return 'Por favor, preencha o nome';
                    }
                    return null;
                  },
                ),
                Container(height: 20),
                const Text(
                  "Não se preocupe, você poderá adicionar mais posteriormente!",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Container(height: 20),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => submitForm(context),
                      child: const Text("Adicionar Pet",
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextInput extends StatelessWidget {
  final void Function(String) onChanged;
  final String? Function(dynamic a) validator;

  const TextInput({Key? key, required this.onChanged, required this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: validator,
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: 'Nome',
          border: OutlineInputBorder(),
        ),
        onChanged: onChanged);
  }
}
