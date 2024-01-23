import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  late String? text;
  double size = 15;
  bool bold = false;
  double padding = 8.0;
  TextAlign textAlign = TextAlign.center;
  late FontWeight fontWeight;

  TextWidget(this.text,
      {this.size = 15,
      this.bold = false,
      this.padding = 8.0,
      this.textAlign = TextAlign.center,
      super.key}) {
    fontWeight = bold ? FontWeight.bold : FontWeight.normal;
    text ??= "null";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Text(
        text!,
        style: TextStyle(fontSize: size, fontWeight: fontWeight),
        textAlign: textAlign,
      ),
    );
  }
}
