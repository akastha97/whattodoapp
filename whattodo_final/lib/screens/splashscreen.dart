import 'package:flutter/material.dart';
import 'package:whattodo_final/consts.dart';
import 'package:whattodo_final/screens/dashboard.dart';
import 'package:whattodo_final/ui_components/custom_appbar.dart';
import 'package:whattodo_final/ui_components/custom_carousel.dart';

// This class is for Splashscreen
// loads everytime the user opens the application. 

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1D3461),
      appBar: const CustomAppbar(
        isDisplay: false,
        showBackButton: false,
        showHeadText: false,
        headText: "",
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
    );
  }

  // This is to display the "Get started" button
  Builder buildGetStartedButton(BuildContext context) {
    return Builder(builder: (context) {
      return ElevatedButton(
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(210, 50),
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

  // This method is to navigate from the Splash screen to the dashboard screen with animation
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
