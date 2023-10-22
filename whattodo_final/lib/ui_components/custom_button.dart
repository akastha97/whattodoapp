import 'package:flutter/material.dart';

class CustomAlertButton extends StatelessWidget {
  final String buttonTitle;
  final void Function() onclick;

  CustomAlertButton({
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
