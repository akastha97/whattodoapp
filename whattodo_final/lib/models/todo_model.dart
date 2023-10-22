// This is a model class for ToDo items

import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 2)

class TodoItem {
  @HiveField(0)
  final String title;

  @HiveField(1)
  bool completed;

  TodoItem({required this.title, this.completed = false});
}
