import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  TextEditingController controller;
  String hint;
  bool obscureText = false;
  ValueChanged<String>? onChanged;
  int? maxLength;

  TextFieldWidget(this.controller, this.hint,
      {this.obscureText = false, this.onChanged, this.maxLength, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 300,
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          maxLength: maxLength,
          obscureText: obscureText,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: hint,
          ),
        ),
      ),
    );
  }
}
