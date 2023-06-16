import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:whattodo_final/ui_components/carousel_content.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  List<String> images = [
    "lib/assets/todo-image.png",
    "lib/assets/todo-2.png",
    "lib/assets/todo-3.png"
  ];

  List<String> headings = [];

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              height: 80,
            ),
            Container(
              height: 600,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
              ),
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 600,
                      viewportFraction: 1,
                      autoPlayInterval: const Duration(seconds: 1),
                    ),
                    items: images.map((image) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            // width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 1.0),
                            decoration: const BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Image.asset(
                                    "lib/assets/todo-image.png",
                                    height: 350,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text("Manage your tasks"),
                                const Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                      "Organize all your tasks in lists and projects. Color tag them to set priorities and categories.",
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
