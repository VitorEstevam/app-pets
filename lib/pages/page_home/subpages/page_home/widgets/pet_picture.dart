import 'package:app_pets/stores/example/store_global.dart';
import 'package:app_pets/widgets/image_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PetPicture extends StatelessWidget {
  const PetPicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _store_global = Provider.of<StoreGlobal>(context);

    return Column(children: [
      Expanded(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Image.asset(_store_global.pets[0].colorIconUrl),
            Image.asset(_store_global.pets[0].petIconUrl),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _store_global
                .pets[0].name, //"Luke", /// @TODO Pegar nome do pet em destaque
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
    ]);
  }
}
