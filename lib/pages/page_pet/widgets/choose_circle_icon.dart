import 'package:app_pets/widgets/image_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseCircleIcon extends StatelessWidget {
  String imgUrl;
  void Function(String) action;
  Widget? button;
  bool isSelected;

  ChooseCircleIcon(this.imgUrl, this.action,
      {Key? key, this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        clipBehavior: Clip.antiAlias,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(const CircleBorder()),
        ),
        child: Image.asset(
          imgUrl,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        onPressed: () {
          action(imgUrl);
        });
  }
}
