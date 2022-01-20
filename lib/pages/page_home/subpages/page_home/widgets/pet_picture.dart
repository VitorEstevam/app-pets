import 'package:app_pets/classes/pet.dart';
import 'package:app_pets/consts/utils.dart';
import 'package:app_pets/stores/pets/store_pets.dart';
import 'package:app_pets/widgets/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PetPicture extends StatelessWidget {
  final Pet pet;
  const PetPicture({
    Key? key,
    required this.pet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Column(children: [
        Expanded(
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(pet.petIconUrl), fit: BoxFit.cover) ,
                color: pet.color,
                shape: BoxShape.circle,
                border: Border.all(color: pet.color.darken(0.15), width: 8)),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              pet.name, //"Luke", /// @TODO Pegar nome do pet em destaque
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              splashRadius: 20.0,
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).primaryColor,
              ),
            )
          ],
        )
      ]),
    );
  }
}
