import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:whattodo_final/models/carousel_model.dart';

// This class is to display the carousel slider
Widget buildCarousel() {
  return Container(
    height: 600,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          spreadRadius: 3,
          color: Colors.cyan,
          blurRadius: 2,
        )
      ],
      color: Colors.white,
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
    margin: const EdgeInsets.symmetric(horizontal: 1.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: Colors.white12,
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
        Text(
          carouselModel.heading,
          style: const TextStyle(
              fontSize: 18,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}
