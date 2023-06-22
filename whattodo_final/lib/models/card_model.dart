class CustomCardsModel {
  final String title;
  final String cardImagePath;
  final String route;

  CustomCardsModel(this.title, this.cardImagePath, this.route);

  static List<CustomCardsModel> customCardsModelList = [
    CustomCardsModel("Add To Do", "lib/assets/appbar1.png", "/todoscreen"),
    CustomCardsModel("Add event", "lib/assets/appbar1.png", "/eventsscreen"),
    CustomCardsModel("Add Journal", "lib/assets/appbar1.png", "/journalscreen"),
  ];
}
