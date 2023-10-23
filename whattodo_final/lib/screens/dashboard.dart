import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:whattodo_final/consts.dart';
import 'package:whattodo_final/manager/hive_manager.dart';
import 'package:whattodo_final/models/category_model.dart';
import 'package:whattodo_final/screens/todo_screen.dart';
import 'package:whattodo_final/ui_components/custom_button.dart';

// This class is for Dashboard screen 
// Which shows all the Todo categories
// along with a FAB to enter a new category
// and to delete a category 

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  TextEditingController categoryController = TextEditingController();
  bool isDelete = false;
  int deleteIndex = -1;
  final _categoryBox = Hive.box("categoryBox");
  HiveManager manager = HiveManager();

  @override
  void initState() {
    if (!_categoryBox.containsKey("CATEGORY")) {
      manager.getdefaultCategoryData();
    } else {
      manager.loadCategoryData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: addCategory(),
      backgroundColor: const Color(0xff1D3461),
      body: Stack(
        children: [
          displayTopContainer(),
          displayDashboardBody(),
        ],
      ),
    );
  }

  // This method is to display the Dashboard top container box  for styling
  Image displayTopContainer() {
    return Image.asset(
      "lib/assets/final-appbarlook.png",
      height: 600,
      width: 430,
      fit: BoxFit.cover,
    );
  }

  // This widget is to display the body of the Dashboard screen
  // where all the category cards are displayed
  Widget displayDashboardBody() {
    return Column(
      children: [
        const SizedBox(height: 180),
        getCategoryListView(),
      ],
    );
  }

  // Method to display the Category cards List view.
  Expanded getCategoryListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: CategoryModel.categoryList.length,
        itemBuilder: (context, index) {
          final isDeleting = deleteIndex == index;
          return GestureDetector(
            onLongPress: () {
              // when user long presses, delete option should be visible
              setState(() {
                deleteIndex = index;
              });
              manager.updateCategoryData();
            },
            onTap: () {
              // navigate to Todo screen
              debugPrint("take to To-do Screen");
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return TodoScreen(
                    category: CategoryModel.categoryList[index].categoryName);
              }));
            },
            child: categoryCard(index, isDeleting),
          );
        },
      ),
    );
  }

  // This method is for category card UI
  Container categoryCard(int index, bool isDeleting) {
    return Container(
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 48, vertical: 20),
      child: Card(
        shadowColor: Colors.white,
        elevation: 5,
        color: Color(0xffC0CFEC),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                CategoryModel.categoryList[index].categoryName,
                style: const TextStyle(
                  fontFamily: "Playpen Sans",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Visibility(
                  visible: isDeleting,
                  child: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      if (isDeleting) {
                        deleteCategoryCard(index);
                      }
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }

  // This method deals with adding a new category when Floating action button is clicked
  FloatingActionButton addCategory() {
    return FloatingActionButton(
      backgroundColor: const Color(0xffF8BEE2),
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
      onPressed: () {
        //  show an alert box with a category title
        showDialog(
            context: context,
            builder: (context) {
              return addCategoryAlert();
            });
      },
    );
  }

  // This is to  display the add category alert dialog box, with "Add" and "Cancel" buttons
  AlertDialog addCategoryAlert() {
    return AlertDialog(
      title: const Text(
        AppConstants.addCatText,
        style: TextStyle(fontSize: 16),
      ),
      content: TextField(
        decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1)),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1)),
            hintStyle: TextStyle(color: Colors.pink)),
        controller: categoryController,
      ),
      actions: [
        Center(
          child: Wrap(
            children: [
              CustomAlertButton(
                buttonTitle: AppConstants.addButtonText,
                onclick: () async {
                  setState(() {
                    CategoryModel.categoryList.add(
                        CategoryModel(categoryName: categoryController.text));

                    Navigator.pop(context);
                  });
                  await manager.updateCategoryData();
                  manager.loadCategoryData();
                  categoryController.clear();
                },
              ),
              const SizedBox(
                width: 10,
              ),
              CustomAlertButton(
                  buttonTitle: AppConstants.cancelButtonText,
                  onclick: () {
                    Navigator.pop(context);
                  }),
            ],
          ),
        )
      ],
    );
  }

  // Method to delete the selected category card on longpress
  void deleteCategoryCard(int index) {
    setState(() {
      CategoryModel.categoryList.removeAt(index);
      deleteIndex = -1;
    });
    manager.updateCategoryData();
  }
}
