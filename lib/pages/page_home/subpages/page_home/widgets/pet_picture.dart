import 'package:app_pets/classes/pet.dart';
import 'package:app_pets/consts/utils.dart';
import 'package:app_pets/pages/page_pet/page_create_pet.dart';
import 'package:app_pets/stores/pets/store_pets.dart';
import 'package:app_pets/widgets/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PetPicture extends StatelessWidget {
  final Pet pet;
  final double size;
  const PetPicture({
    Key? key,
    required this.size,
    required this.pet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      height: size,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size * 0.5,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(pet.petIconUrl),
                  // fit: BoxFit.cover,
                ),
                color: pet.color,
                shape: BoxShape.circle,
                border: Border.all(color: pet.color.darken(0.15), width: 8),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  pet.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  splashRadius: 20.0,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PageCreatePet(
                            pet: pet,
                          ),
                        ));
                  },
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
