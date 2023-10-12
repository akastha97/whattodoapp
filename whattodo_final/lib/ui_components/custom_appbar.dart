import 'package:flutter/material.dart';

// This class is for the app bar
class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  final Function? customAction;
  final bool isDisplay;
  final bool showBackButton;
  const CustomAppbar(
      {Key? key,
      this.customAction,
      required this.isDisplay,
      required this.showBackButton})
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
      iconTheme: IconThemeData(
        color: Color(0xff1F487E), //change your color here
      ),
      automaticallyImplyLeading: widget.showBackButton,
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      actions: <Widget>[
        Visibility(
          visible: widget.isDisplay,
          child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  widget.customAction!();
                },
                child: const Icon(
                  Icons.edit,
                  color: Colors.cyan,
                  size: 28,
                ),
              )),
        ),
      ],
      title: Image.asset(
        "lib/assets/cn.png",
        width: 200,
        height: 250,
      ),
    );
  }
}
