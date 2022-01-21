import 'package:app_pets/classes/pet.dart';
import 'package:app_pets/pages/page_pet/widgets/choose_circle_color.dart';
import 'package:app_pets/pages/page_pet/widgets/color_selector.dart';
import 'package:app_pets/pages/tab_bar_handler.dart';
import 'package:app_pets/stores/pets/store_pets.dart';
import 'package:app_pets/widgets/general_form_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/icon_selector.dart';

class PageCreatePet extends StatelessWidget {
  String? name;
  String? image;
  Color? color;
  final _formKey = GlobalKey<FormState>();

  void chooseIcon(String stringUrl) {
    print(stringUrl);
    image = stringUrl;
  }

  void chooseColor(Color _color) {
    color = _color;
  }

  void chooseName(String _name) {
    name = _name;
  }

  void createAnimal(BuildContext context) {
    Provider.of<StorePets>(context, listen: false)
        .addNewPet(Pet(name!, image!, color!));

    if (Navigator.of(context).canPop()) {
      Navigator.pop(context);
    } else {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => const TabBarHandler()));
    }
  }

  void submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      createAnimal(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PetsApp"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(height: 20),
              GeneralFormField(
                validator: (_) {
                  if (image == null) {
                    return 'Por favor, selecione um ícone';
                  }
                  return null;
                },
                widget: IconSelector(onSelect: chooseIcon),
              ),
              Container(height: 20),
              GeneralFormField(
                validator: (_) {
                  if (color == null) {
                    return 'Por favor, selecione uma cor';
                  }
                  return null;
                },
                widget: ColorSelector(onSelect: chooseColor),
              ),
              Container(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextInput(
                  onChanged: chooseName,
                  validator: (_) {
                    if (name == null || name == "") {
                      return 'Por favor, preencha o nome';
                    }
                    return null;
                  },
                ),
              ),
              Container(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "Não se preocupe, você poderá adicionar mais posteriormente!",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                    onPressed: () => submitForm(context),
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
                              Text('ADICIONAR PET')
                            ],
                          ),
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextInput extends StatelessWidget {
  final void Function(String) onChanged;
  final String? Function(String?)? validator;

  const TextInput({
    Key? key,
    required this.onChanged,
    required this.validator,
  }) : super(key: key);

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
