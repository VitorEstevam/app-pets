import 'package:app_pets/classes/pet.dart';
import 'package:app_pets/consts/theme.dart';
import 'package:app_pets/debug_config.dart';
import 'package:app_pets/pages/page_home/subpages/page_add_task/page_add_task.dart';
import 'package:app_pets/pages/page_home/subpages/page_add_task/page_add_task.dart';
import 'package:app_pets/pages/page_pet/page_create_pet.dart';
import 'package:app_pets/stores/pets/store_pets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'widgets/pet_picture.dart';
import 'widgets/task_view.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      var pet = Provider.of<StorePets>(context).actualPet!;
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).backgroundColor,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PageAddTask(),
            ),
          ),
          label: const Text('ADICIONAR TAREFA'),
          icon: const Icon(Icons.add),
        ),
        appBar: AppBar(
          title: const Text("nome do app"),
          actions: [
            IconButton(
                onPressed: () => debugOptions(context),
                icon: Icon(Icons.bug_report))
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(height: 10),
            Container(
              width: double.infinity,
              child: PetSelector(pet),
            ),
            // const MainButtons(),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: TaskViewer(
                    pet: pet,
                  ),
                ),
              ),
            ),
            Container(
              height: 40,
            )
          ],
        ),
      );
    });
  }
}

class PetSelector extends StatefulWidget {
  final pet;
  const PetSelector(
    this.pet, {
    Key? key,
  }) : super(key: key);

  @override
  State<PetSelector> createState() => _PetSelectorState();
}

class _PetSelectorState extends State<PetSelector> {
  CarouselController buttonCarouselController = CarouselController();
  bool start = true;
  Future getFutureDados(index) async =>
      await Future.delayed(Duration(milliseconds: 0), () {
        if (start == true) {
          buttonCarouselController.animateToPage(index);
          print("started");
        } else {
          start = true;
        }
      });

  @override
  Widget build(BuildContext context) {
    var index = Provider.of<StorePets>(context).getActualPetIndex();
    var pets = Provider.of<StorePets>(context, listen: false).pets;

    return FutureBuilder(
        future: getFutureDados(index),
        builder: (context, snapshot) {
          return CarouselSlider(
            carouselController: buttonCarouselController,
            items: [
              for (var i = 0; i < pets.length; i++)
                GestureDetector(
                    onTap: () => buttonCarouselController.animateToPage(i),
                    child: PetPicture(pet: pets[i])),
            ],
            options: CarouselOptions(
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              aspectRatio: 1,
              height: 250,
              viewportFraction: 0.5,
              initialPage:
                  Provider.of<StorePets>(context).getPetIndex(widget.pet),
              onPageChanged: (index, other) {
                Provider.of<StorePets>(context, listen: false)
                    .setActualPet(pets[index]);
                start = false;
              },
            ),
          );
        });
  }
}

class MainButtons extends StatelessWidget {
  const MainButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(
                  (Theme.of(context).primaryColor),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.white,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                    side: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                ),
              ),
              onPressed: () {},
              child: const SizedBox(
                height: 40,
                child: Center(
                  child: Text("VER TODOS",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: ElevatedButton(
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageCreatePet(),
                      ),
                    ),
                child: SizedBox(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.add),
                      Text("ADICIONAR PET",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
