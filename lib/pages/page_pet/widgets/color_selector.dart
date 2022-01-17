import 'package:app_pets/consts/utils.dart';
import 'package:flutter/material.dart';

class ColorSelector extends StatefulWidget {
  final void Function(Color color) onSelect;

  const ColorSelector({Key? key, required this.onSelect}) : super(key: key);

  @override
  _ColorSelectorState createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  List<Color> colors = [
    Colors.green,
    Colors.purple,
    Colors.yellow,
    Colors.red,
    Colors.green,
    Colors.purple,
    Colors.yellow,
    Colors.red,
  ];
  int? selected;
  int itemsPerRow = 4;

  Widget colorWidget(index, Color color) {
    return ChooseCircleColor(
      color,
      (a) {
        widget.onSelect(a);
        setState(() {
          selected = index;
        });
      },
      selected == index,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Selecione uma cor para ele",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Container(height: 20),
        Wrap(
          spacing: 15,
          runSpacing: 15,
          children: [
            for (var j = 0; j < colors.length; j++) colorWidget(j, colors[j]),
          ],
        ),
      ],
    );
  }
}

class ChooseCircleColor extends StatelessWidget {
  Color color = Colors.white;
  bool isSelected = false;
  void Function(Color) action;

  ChooseCircleColor(this.color, this.action, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: OutlinedButton(
        clipBehavior: Clip.antiAlias,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
            shape: MaterialStateProperty.all<OutlinedBorder>(CircleBorder()),
            side: isSelected
                ? MaterialStateProperty.all<BorderSide>(
                    BorderSide(color: color.darken(0.15), width: 5))
                : null),
        onPressed: () {
          action(color);
        },
        child: Container(
        ),
      ),
    );
  }
}
