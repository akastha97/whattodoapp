import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:whattodo_final/models/carousel_model.dart';
import 'package:whattodo_final/screens/dashboard.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:whattodo_final/screens/events.dart';

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
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/dashboard': (context) => const DashboardScreen(),
        '/eventsscreen': (context) => const EventsScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: const CustomAppbar(
          isDisplay: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              buildCarousel(),
              const SizedBox(
                height: 40,
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
              backgroundColor: Colors.deepOrange),
          onPressed: () {
            Navigator.of(context).push(navigateToDashboard());
          },
          child: const Text("Get Started"));
    });
  }

  // animation for splash
  Route navigateToDashboard() {
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

  // This is to display the carousel slider
  Widget buildCarousel() {
    return Container(
      height: 600,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            spreadRadius: 3,
            color: Colors.cyan,
            blurRadius: 2,
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: CarouselModel.carouselModelList.length,
            options: CarouselOptions(
              autoPlayCurve: Curves.decelerate,
              autoPlay: true,
              autoPlayAnimationDuration: const Duration(seconds: 1),
              height: 600,
              viewportFraction: 1,
            ),
            itemBuilder: (BuildContext context, int itemIndex, int index) {
              return buildView(itemIndex);
            },
          ),
        ],
      ),
    );
  }

  // This is to display the contents of the carousel slider
  Container buildView(int index) {
    final carouselModel = CarouselModel.carouselModelList[index];
    return Container(
      // width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 1.0),
      decoration: const BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              carouselModel.assetPath,
              height: 350,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(carouselModel.heading),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
                "Organize all your tasks in lists and projects. Color tag them to set priorities and categories.",
                textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
