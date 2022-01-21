import 'package:app_pets/consts/utils.dart';
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
              return Container(
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
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                              Row(
                                children: [
                                  Material(
                                    color: Colors.transparent,
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(1000.0)),
                                    clipBehavior: Clip.antiAlias,
                                    child: InkWell(
                                        onTap: () {},
                                        child: const Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Icon(
                                            Icons.edit,
                                            size: 25,
                                            color: Colors.white,
                                          ),
                                        )),
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(1000.0)),
                                    clipBehavior: Clip.antiAlias,
                                    child: InkWell(
                                        onTap: () {},
                                        child: const Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Icon(
                                            Icons.delete_rounded,
                                            size: 25,
                                            color: Colors.white,
                                          ),
                                        )),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        width: double.infinity,
                        color: pet.color.darken(0.15),
                      ),
                    ),
                  ],
                ),
              );
            });
      }),
    );
  }
}
