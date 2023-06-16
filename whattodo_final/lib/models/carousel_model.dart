class CarouselModel {
  final String assetPath;
  final String heading;

  CarouselModel({required this.assetPath, required this.heading});

   static List<CarouselModel> carouselModelList = [
    CarouselModel(
      assetPath: "lib/assets/todo-image.png",
      heading: "Manage your Tasks",
    ),
    CarouselModel(
      assetPath: "lib/assets/todo-2.png",
      heading: "Work on Time",
    ),
    CarouselModel(
      assetPath: "lib/assets/todo-3.png",
      heading: "Get Reminder on Time",
    ),
  ];
}
