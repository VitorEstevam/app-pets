
import 'package:app_pets/widgets/image_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseCircleColor extends StatelessWidget {

  String imgUrl;
  Color color = Colors.white;
  void Function(Color) action; 

  ChooseCircleColor(this.imgUrl, this.color, this.action);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      child: Image.asset(imgUrl, width: 70, height: 70),
      onPressed: (){ action(color); },
    );
  }
}