import 'package:flutter/material.dart';
import 'package:whattodo_final/models/card_model.dart';
import '../ui_components/custom_appbar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool displayCards = false;
  bool displayCentertext = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppbar(
          showBackButton: false,
          isDisplay: true,
          customAction: () {
            showCards();
          },
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(
            height: 20,
          ),
          Visibility(
            visible: displayCentertext,
            child: const Center(
                child: Text(
              "Click the pencil icon to add your lists",
              style: TextStyle(fontSize: 16),
            )),
          ),
          Visibility(
            visible: displayCards,
            child: Flexible(
                child: ListView.builder(
              itemCount: CustomCardsModel.customCardsModelList.length,
              itemBuilder: ((context, index) => Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context,
                            CustomCardsModel
                                .customCardsModelList[index].route);
                      },
                      child: Container(
                        height: 150,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 5,
                          child: Center(
                            child: Text(CustomCardsModel
                                .customCardsModelList[index].title),
                          ),
                        ),
                      ),
                    ),
                  )),
            )),
          ),
        ]));
  }

  bool showCards() {
    setState(() {
      displayCards = true;
      displayCentertext = false;
    });
    return displayCards;
  }
}
