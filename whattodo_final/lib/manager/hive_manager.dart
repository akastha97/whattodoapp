import 'package:hive_flutter/hive_flutter.dart';
import 'package:whattodo_final/models/category_model.dart';
import 'package:whattodo_final/models/todo_model.dart';

// This class deals with all the Crud operations related to Hive

class HiveManager {
  List<CategoryModel> _catList = [];
  List<TodoItem> _todoList = [];

  // Referring to category box
  final categoryBox = Hive.box("categoryBox");
  // Referring to Todo box
  final todoBox = Hive.box("todoBox");

  bool dataLoaded = false;
  
  // method to get default category data when the app is loaded for the first time 
  List<CategoryModel> getdefaultCategoryData() {
    _catList = CategoryModel.categoryList;
    return _catList;
  }

  // method to load the all the existing category data 
  // including the default ones and newly added categories
  void loadCategoryData() {
    if (!dataLoaded) {
      _catList = categoryBox.get("CATEGORY").cast<CategoryModel>();
      CategoryModel.categoryList = _catList; // Update the in-memory list
      dataLoaded = true;
    }
  }
  
  // Method to update the Category Hive box
  Future<void> updateCategoryData() async {
    await categoryBox.put("CATEGORY", _catList);
  }

  // Method to get Todo items for a specific category when the app loads for the first time.
  List<TodoItem> getDefaultTodoDataForCategory(String category) {
    return todoBox.get(category)?.cast<TodoItem>() ?? [];
  }

  // Method to load Todo items for the specific category when new todo data is added
  // and when app gets refreshed
  void loadTodoDataForCategory(String category) {
    if (!dataLoaded) {
      _todoList = getDefaultTodoDataForCategory(category);
      dataLoaded = true;
    }
  }

  // Method to update Todo items for the specific category
  Future<void> updateTodoItemsForCategory(
      String category, List<TodoItem> todoItems) async {
    await todoBox.put(category, todoItems);
  }

  // Method to add a Todo item for the current category
  void addTodoItemForCategory(TodoItem todoItem, String category) {
    // Load the current Todo items for the category
    List<TodoItem> categoryTodos = getDefaultTodoDataForCategory(category);
    // Add the new Todo item to the list for the category
    categoryTodos.add(todoItem);
    // Update the Todo items for the category with the modified list
    updateTodoItemsForCategory(category, categoryTodos);
  }

  // Method to remove a Todo item for the current category and then updating the Todo list
  void removeTodoItemForCategory(int index, String category) {
    if (index >= 0 && index < _todoList.length) {
      _todoList.removeAt(index);
      updateTodoItemsForCategory(category, _todoList);
    }
  }
}
