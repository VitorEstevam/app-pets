import 'package:flutter/material.dart';

class GeneralFormField extends FormField<dynamic> {

  GeneralFormField({Key? key, 
    required FormFieldValidator<dynamic> validator,
    required Widget widget

  }) : super(key: key, 
    validator: validator,
    builder: (FormFieldState<dynamic> state) {
      return Column(
        children: [
          widget,
          state.hasError?
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              state.errorText ?? "",
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12
              ),
            ),
          ),
        ) :
        Container()
        ],
      );
    }
  );
}