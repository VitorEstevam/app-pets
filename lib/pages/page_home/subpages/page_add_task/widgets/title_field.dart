
import 'package:flutter/material.dart';

class TitleField extends StatefulWidget {
  final String initialValue;
    final void Function(String val) callback;
  const TitleField({
    Key? key, required this.callback, this.initialValue="",
  }) : super(key: key);

  @override
  State<TitleField> createState() => _TitleFieldState();
}

class _TitleFieldState extends State<TitleField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: 'Título',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, preencha o título';
        }
        return null;
      },
      onChanged: widget.callback
    );
  }
}