import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:whattodo_final/consts.dart';
import 'package:whattodo_final/screens/dashboard.dart';
import 'package:whattodo_final/screens/todo_screen.dart';
import 'package:whattodo_final/theme.dart';
import 'package:whattodo_final/ui_components/custom_carousel.dart';

import 'ui_components/custom_appbar.dart';

void main() {
  timeDilation = 2.0;
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  // This is for the body of the main screen
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      darkTheme: darkMode,
      routes: {
        '/dashboard': (context) => const DashboardScreen(),
        '/todoscreen': (context) => TodoScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff1D3461),
        appBar: const CustomAppbar(
          isDisplay: false,
          showBackButton: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: buildCarousel(),
              ),
              buildGetStartedButton(context),
            ],
          ),
        ),
      ),
    );
  }

  // This is to display the Get started button
  Builder buildGetStartedButton(BuildContext context) {
    return Builder(builder: (context) {
      return ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(120, 40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 10,
              backgroundColor: const Color(0xff376996)),
          onPressed: () {
            Navigator.of(context).push(navigateToDashboardScreen());
          },
          child: const Text(AppConstants.getStarted));
    });
  }

  // This method is to navigate to the dashboard screen with animation
  Route navigateToDashboardScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const DashboardScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.decelerate;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
