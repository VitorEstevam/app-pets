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
  String? animalName;
  String? animalImageUrl;
  String? iconColorUrl;
  Color? iconColor;

  void choose_icon(String stringUrl) {
    print(stringUrl);
    animalImageUrl = stringUrl;
  }

  void choose_color(Color color) {
    iconColor = color;
  }

  void setAnimalName(String name) {
    animalName = name;
  }

  void createAnimal(BuildContext context) {
    Provider.of<StoreGlobal>(context, listen: false)
        .addNewPet(Pet(animalName!, animalImageUrl!, iconColor!));

    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const TabBarHandler()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("nome do app"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 20),
              IconSelector(onSelect: choose_icon),
              
              Container(height: 20),
              ColorSelector(onSelect: choose_color),

              Container(height: 20),
              const Text(
                "Nome do seu animal",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
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
                  onChanged: setAnimalName),
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
                    onPressed: () => createAnimal(context),
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
    );
  }
}


