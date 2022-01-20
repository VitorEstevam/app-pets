import 'package:app_pets/pages/page_pet/page_create_pet.dart';
import 'package:app_pets/stores/pets/store_pets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class PagePets extends StatefulWidget {
  const PagePets({Key? key}) : super(key: key);

  @override
  State<PagePets> createState() => _PagePetsState();
}

class _PagePetsState extends State<PagePets> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      var pets = Provider.of<StorePets>(context).pets;
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: const Text("Meus Pets"),
          actions: [
            IconButton(
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageCreatePet(),
                      ),
                    ),
                icon: const Icon(Icons.add))
          ],
        ),
      );
    });
  }
}
