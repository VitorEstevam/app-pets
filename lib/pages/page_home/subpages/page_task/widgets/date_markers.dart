import 'package:app_pets/consts/utils.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ComingMarker extends StatelessWidget {
  final date;
  const ComingMarker(
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
          child: Text(
            date.day.toString(),
            style: TextStyle(
                fontWeight:
                    isToday(date) ? FontWeight.w900 : FontWeight.normal),
          ),
        ),
      ),
    );
  }
}

class EventMarker extends StatelessWidget {
  final date;
  final Color color;

  const EventMarker(
    this.date,
    this.color, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Center(
          child: Text(
            date.day.toString(),
            style: TextStyle(
                color: Colors.white,
                fontWeight:
                    isToday(date) ? FontWeight.w900 : FontWeight.normal),
          ),
        ),
      ),
    );
  }
}
