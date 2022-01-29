import 'package:app_pets/consts/utils.dart';
import 'package:app_pets/pages/page_pet/page_create_pet.dart';
import 'package:app_pets/pages/page_pet/pet_tasks.dart';
import 'package:app_pets/stores/pets/store_pets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

enum option {
  a,
  b,
}

class PagePets extends StatefulWidget {
  const PagePets({Key? key}) : super(key: key);

  @override
  State<PagePets> createState() => _PagePetsState();
}

class _PagePetsState extends State<PagePets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PageCreatePet(),
            ),
          ),
          label: const Text('ADICIONAR PET'),
          icon: const Icon(Icons.add),
        ),
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text("Meus Pets"),
      ),
      body: const GridPets(),
    );
  }
}

class GridPets extends StatefulWidget {
  const GridPets({
    Key? key,
  }) : super(key: key);

  @override
  State<GridPets> createState() => _GridPetsState();
}

class _GridPetsState extends State<GridPets> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Observer(builder: (context) {
        var pets = Provider.of<StorePets>(context).pets;
        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 4 / 5,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: pets.length,
            itemBuilder: (BuildContext ctx, index) {
              var pet = pets[index];
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PetTasks(pet: pet),
                  ),
                ),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: FittedBox(
                              child: Image.asset(pet.petIconUrl),
                              fit: BoxFit.cover),
                          width: double.infinity,
                          color: pet.color,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  pets[index].name,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                PopupMenuButton<option>(
                                  icon: Icon(
                                    Icons.more_vert,
                                    color: Colors.white,
                                  ),
                                  onSelected: (option result) {
                                    setState(() {
                                      switch (result) {
                                        case option.a:
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    PageCreatePet(
                                                  pet: pet,
                                                ),
                                              ));

                                          break;
                                        case option.b:
                                          Provider.of<StorePets>(context,
                                                  listen: false)
                                              .removePet(pet);

                                          saveState(context);
                                          break;
                                      }
                                    });
                                  },
                                  itemBuilder: (BuildContext context) =>
                                      <PopupMenuEntry<option>>[
                                    const PopupMenuItem<option>(
                                      value: option.a,
                                      child: Text('Editar Pet'),
                                    ),
                                    const PopupMenuItem<option>(
                                      value: option.b,
                                      child: Text('Apagar Pet'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          width: double.infinity,
                          color: pet.color.darken(0.15),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      }),
    );
  }
}
