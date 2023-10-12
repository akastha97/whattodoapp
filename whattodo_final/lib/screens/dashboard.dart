import 'package:flutter/material.dart';
import 'package:whattodo_final/consts.dart';
import 'package:whattodo_final/screens/todo_screen.dart';

import '../ui_components/custom_appbar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool displayCards = false;
  bool displayCentertext = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff1D3461),
        appBar: CustomAppbar(
          showBackButton: false,
          isDisplay: true,
          customAction: () {
            showBodyText();
          },
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Visibility(
            visible: displayCentertext,
            child: const Center(
              child: Text(
                AppConstants.pencilText,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Visibility(
            visible: !displayCentertext,
            child: Expanded(child: TodoScreen()),
          ),
        ]));
  }

  // This method is to toggle the body text on the screen once the pencil icon is clicked.
  bool showBodyText() {
    setState(() {
      displayCentertext = false;
    });
    return displayCentertext;
  }
}
