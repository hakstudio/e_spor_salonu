import 'package:e_spor_salonu/widget/text_widget.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  IconData icon;
  String text;
  VoidCallback onPressed;
  MainAxisSize mainAxisSize;

  ButtonWidget(this.icon, this.text, this.onPressed,
      {super.key, this.mainAxisSize = MainAxisSize.min});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: mainAxisSize,
            children: [
              Icon(
                icon,
                size: 30,
              ),
              TextWidget(text, size: 20)
            ],
          ),
        ),
      ),
    );
  }
}
