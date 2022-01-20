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
          title: const Text("App Pets"),
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
            Expanded(
              flex: 1,
              child: PetSelector(pet),
            ),
            Container(height: 30),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: Text(
                  "Tarefas",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
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
              height: 20,
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
                    child: PetPicture(pet: pets[i], size:MediaQuery.of(context).size.height / 2)),
            ],
            options: CarouselOptions(
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              // height: 275,
              height: MediaQuery.of(context).size.height / 2,
              aspectRatio: 1.5,
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

