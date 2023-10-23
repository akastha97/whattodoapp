import 'package:flutter/material.dart';

// This custom class is for the buttons in the Alert box. 
class CustomAlertButton extends StatelessWidget {
  final String buttonTitle;
  final void Function() onclick;

  const CustomAlertButton({
    Key? key,
    required this.buttonTitle,
    required this.onclick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.pink),
      ),
      onPressed: onclick,
      child: Text(buttonTitle),
    );
  }
}
