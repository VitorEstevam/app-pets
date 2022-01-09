import 'package:flutter/material.dart';

class PetSelector extends StatefulWidget {
  final void Function(String selected) callback;
  final List<String> pets;

  const PetSelector({
    Key? key,
    required this.callback,
    required this.pets,
  }) : super(key: key);

  @override
  State<PetSelector> createState() => _PetSelectorState();
}

class _PetSelectorState extends State<PetSelector> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: 'Seu pet',
        border: OutlineInputBorder(),
      ),
      // hint: const Text("Seu pet"),
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, Selecione seu pet';
        }
        return null;
      },
      items: widget.pets
          .map((e) => DropdownMenuItem<String>(
                value: e,
                child: Text(e),
              ))
          .toList(),
      onChanged: (String? _selected) {
        if (_selected != null) {
          widget.callback(_selected);
        }
      },
    );
  }
}
