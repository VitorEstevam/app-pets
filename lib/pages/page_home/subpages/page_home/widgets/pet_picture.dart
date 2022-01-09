import 'package:app_pets/widgets/image_loader.dart';
import 'package:flutter/material.dart';

class PetPicture extends StatelessWidget {
  const PetPicture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Expanded(
        child: FittedBox(
          fit: BoxFit.fitHeight,
          alignment: Alignment.bottomCenter,
          child: ImageLoader("lib/assets/dog1.jpeg"),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Luke",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            splashRadius:20.0,
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
