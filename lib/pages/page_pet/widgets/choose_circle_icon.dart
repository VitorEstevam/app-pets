
import 'package:app_pets/widgets/image_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseCircleIcon extends StatelessWidget {

  String imgUrl;
  void Function(String) action; 

  ChooseCircleIcon(this.imgUrl, this.action);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      child: Image.asset(imgUrl, width: 70, height: 70),
      onPressed: (){ action(imgUrl); },
    );
  }
}