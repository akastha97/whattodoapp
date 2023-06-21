
class CustomCardsModel {
  final String title;
  final String cardImagePath;
  final Function() ontap;

  CustomCardsModel( this.title,this.cardImagePath, this.ontap);

  static List<CustomCardsModel> customCardsModelList = [
    CustomCardsModel(
      "Add To Do",
      "lib/assets/appbar1.png",
      () {},
    ),
    CustomCardsModel(
      "Add event",
      "lib/assets/appbar1.png",
      () {},
    ),
    CustomCardsModel(
      "Add event",
      "lib/assets/appbar1.png",
      () {},
    ),
  ];
}
