import 'package:flutter/material.dart';

class IconSelector extends StatefulWidget {
  final void Function(String) onSelect;
  final String? initialValue;
  const IconSelector({Key? key, required this.onSelect, this.initialValue})
      : super(key: key);

  @override
  State<IconSelector> createState() => _IconSelectorState();
}

class _IconSelectorState extends State<IconSelector> {
  List<String> icons = [
    "lib/assets/pets/CAT.png",
    "lib/assets/pets/CAT1.png",
    "lib/assets/pets/CAT2.png",
    "lib/assets/pets/CAT3.png",
    "lib/assets/pets/DOG.png",
    "lib/assets/pets/DOG2.png",
    "lib/assets/pets/DOG3.png",
    "lib/assets/pets/DOG4.png",
  ];
  int? selected;

  Widget iconWidget(index, path) {
    return ChooseCircleIcon(
      path,
      (a) {
        widget.onSelect(a);
        setState(() {
          selected = index;
        });
      },
      isSelected: selected == index,
    );
  }

  int getIconIndex(String ico) {
    return icons.indexOf(ico);
  }

  @override
  void initState() {
    if (widget.initialValue != null) {
      selected = getIconIndex(widget.initialValue!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Selecione um ícone para seu pet",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(height: 20),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 15,
          runSpacing: 15,
          children: [
            for (var i = 0; i < icons.length; i++) iconWidget(i, icons[i]),
          ],
        ),
      ],
    );
  }
}

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
    return SizedBox(
      width: 75,
      height: 75,
      child: OutlinedButton(
          clipBehavior: Clip.antiAlias,
          style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(0)),
              shape: MaterialStateProperty.all<OutlinedBorder>(CircleBorder()),
              side: isSelected
                  ? MaterialStateProperty.all<BorderSide>(BorderSide(
                      color: Theme.of(context).primaryColor, width: 5))
                  : null),
          child: Image.asset(
            imgUrl,
            width: 75,
            height: 75,
            fit: BoxFit.cover,
          ),
          onPressed: () {
            action(imgUrl);
          }),
    );
  }
}
