
import 'package:app_pets/widgets/image_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseCircleIcon extends StatelessWidget {

  String imgUrl;
  void Function(String) action; 
  Widget ?button;
 

  ChooseCircleIcon(this.imgUrl, this.action){
    button = OutlinedButton(
      child: Image.asset(imgUrl, width: 100, height: 100),
      onPressed: (){   action(imgUrl); }
    ); 
  }

  @override
  Widget build(BuildContext context) {
    return button!;
  }
}