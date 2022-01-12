
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
    return Container(
      child: OutlinedButton(
        child: Image.asset(imgUrl, width: 100, height: 100, fit: BoxFit.fill,),
        onPressed: (){   action(imgUrl, color); }
      )
    ); 
  }
}