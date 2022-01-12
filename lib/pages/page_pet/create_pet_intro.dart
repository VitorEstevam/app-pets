import 'package:app_pets/classes/pet.dart';
import 'package:app_pets/pages/page_pet/widgets/choose_circle_color.dart';
import 'package:app_pets/pages/page_pet/widgets/choose_circle_icon.dart';
import 'package:app_pets/pages/tab_bar_handler.dart';
import 'package:app_pets/stores/example/store_global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CreatePetIntro extends StatelessWidget {
  
  String ?animalName;
  String ?animalImageUrl;
  Color ?iconColor; 

  void choose_icon(String stringUrl){
    animalImageUrl = stringUrl;
  }

  void choose_color(Color color){
    iconColor = color;
  }

  void setAnimalName(String name){
    animalName = name;
  }

  void checkAllDone(){

  }
  

  @override
  Widget build(BuildContext context) {
    var _store_global = Provider.of<StoreGlobal>(context);

    void createAnimal(){
      _store_global.addNewPet( Pet(animalName!, animalImageUrl!, iconColor!) );
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> TabBarHandler()));
    }  
    
    return Scaffold(
     appBar: AppBar(
        title: const Text("nome do app"),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Text(
              "Selecione seu pet", 
              style: TextStyle(fontSize: 18),
              ),
            ),
          
          ChooseCircleIcon("lib/assets/dog1.jpeg", choose_icon),
          
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Text(
              "Selecione uma cor para ele", 
              style: TextStyle(fontSize: 18),
              ),
            ),

          ChooseCircleColor("lib/assets/purple_icon.png", Colors.white, choose_color),
          
          Container(
             alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Text(
              "Nome do seu animal", 
              style: TextStyle(fontSize: 18),
              ),
            ),

          Container( 
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onSubmitted: setAnimalName, 
              maxLength: 30, 
              onChanged: setAnimalName,
            ),
          ),
          
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets. symmetric(vertical: 20, horizontal: 20),
            child: Text(
              "Não se preocupe, você poderá adicionar mais posteriormente!", 
              style: TextStyle(fontSize: 16),
              ),
            ),

          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(vertical: 10),
            
            child: SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton( 
                onPressed: createAnimal, 
                child:  Text("Adicionar Pet",  style: TextStyle(fontSize: 20,)),
              ), 
            ),
          )
        ],),
    );
  }
}