import 'package:whattodo_final/consts.dart';

// This is a model class for the Carousel slides
class CarouselModel {
  final String assetPath;
  final String heading;

  CarouselModel({required this.assetPath, required this.heading});

  static List<CarouselModel> carouselModelList = [
    CarouselModel(
      assetPath: "lib/assets/todo-image.png",
      heading: AppConstants.splashText1,
    ),
    CarouselModel(
      assetPath: "lib/assets/todo-2.png",
      heading: AppConstants.splashText2,
    ),
    CarouselModel(
      assetPath: "lib/assets/todo-3.png",
      heading: AppConstants.splashText3,
    ),
  ];
}
