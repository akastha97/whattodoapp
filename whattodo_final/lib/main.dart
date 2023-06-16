import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:whattodo_final/models/carousel_model.dart';
import 'package:whattodo_final/screens/dashboard.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {
         
        });
      });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/dashboard': (context) => const DashboardScreen(),
      },
      // 51 50 55
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
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

  // This is to display the Button
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
            Navigator.pushNamed(context, "/dashboard");
          },
          child: const Text("Get Started"));
    });
  }

  // This is to display the carousel slider
  Container buildCarousel() {
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
