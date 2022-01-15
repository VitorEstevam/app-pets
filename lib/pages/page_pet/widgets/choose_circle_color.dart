import 'package:app_pets/widgets/image_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseCircleColor extends StatelessWidget {
  String imgUrl;
  Color color = Colors.white;
  void Function(String, Color) action;

  ChooseCircleColor(this.imgUrl, this.color, this.action);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        clipBehavior: Clip.antiAlias,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
              const CircleBorder()),
        ),
        child: Image.asset(
          imgUrl,
          fit: BoxFit.cover,
        ),
        onPressed: () {
          action(imgUrl, color);
        });
  }
}
