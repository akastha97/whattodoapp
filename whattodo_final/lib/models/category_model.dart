import 'package:hive/hive.dart';

part 'category_model.g.dart';

// This class is for Category model
// with 3 default categories

@HiveType(typeId: 1)
class CategoryModel {
  @HiveField(0)
  final String categoryName;

  CategoryModel({required this.categoryName});

  static List<CategoryModel> categoryList = [
    CategoryModel(categoryName: "Work"),
    CategoryModel(categoryName: "Personal"),
    CategoryModel(categoryName: "School"),
  ];
}
