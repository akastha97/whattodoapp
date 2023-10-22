import 'package:flutter/material.dart';

// This class is for the app bar
class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  final Function? customAction;
  final bool isDisplay;
  final bool showBackButton;
  final bool showHeadText;
  final String headText;
  
  const CustomAppbar(
      {Key? key,
      this.customAction,
      required this.isDisplay,
      required this.showBackButton,
      required this.showHeadText,
      required this.headText
      })
      : super(key: key);

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Color(0xff1F487E), //change your color here
      ),
      automaticallyImplyLeading: widget.showBackButton,
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: widget.showHeadText
          ? Text(
              widget.headText,
              style: const TextStyle(
                  color: Colors.pink,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )
          : Image.asset(
              "lib/assets/appbar-logo.png",
              height: 200,
            ),
    );
  }
}
