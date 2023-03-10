import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    @required this.text,
    @required this.onClicked,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onClicked,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white, // Background color
          foregroundColor: Colors.blue, // Text Color (Foreground color)
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 24),
        ),
      );
}
