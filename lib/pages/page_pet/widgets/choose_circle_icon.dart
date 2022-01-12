
import 'package:app_pets/widgets/image_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseCircleIcon extends StatelessWidget {

  String imgUrl;
  void Function(String) action; 
  Widget ?button;
 

  ChooseCircleIcon(this.imgUrl, this.action);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: OutlinedButton(
        child: Image.asset(imgUrl, width: 175, height: 100, fit: BoxFit.fill,),
        onPressed: (){   action(imgUrl); }
      )
    ); 
  }
}