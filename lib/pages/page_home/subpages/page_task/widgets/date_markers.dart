import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class comingMarker extends StatelessWidget {
  final date;
  const comingMarker(
    this.date, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DottedBorder(
        borderType: BorderType.Circle,
        strokeWidth: 1,
        dashPattern: [4, 4],
        child: Center(
          child: Text(date.day.toString()),
        ),
      ),
    );

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.yellow,
      ),
      child: Center(
        child: Text(date.day.toString()),
      ),
    );
  }
}
