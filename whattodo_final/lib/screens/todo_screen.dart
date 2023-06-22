import 'package:flutter/material.dart';
import 'package:whattodo_final/ui_components/custom_appbar.dart';
import '../models/todo_model.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<TodoItem> todos = [];
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(isDisplay: false),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return ListTile(
                dense: true,
                leading: Checkbox(
                  value: todos[index].completed,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  onChanged: (value) {
                    toggleTodoCompletion(index);
                  },
                ),
                title: Text(
                  todos[index].title,
                  style: TextStyle(
                    fontSize: 16,
                    color: todos[index].completed ? Colors.red : Colors.cyan,
                    decoration: todos[index].completed
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.remove_circle,
                    color: Colors.red[400],
                  ),
                  onPressed: () {
                    deleteTodoAtIndex(index);
                  },
                ),
              );
            },
          ),
          ListTile(
            dense: true,
            leading: Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              value: false,
              onChanged: (value) {},
            ),
            title: Expanded(
              child: TextField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  hintText: 'Add description',
                ),
              ),
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.add_circle_outline_outlined,
                color: Colors.cyan[400],
              ),
              onPressed: () {
                setState(() {
                  todos.add(TodoItem(title: _textEditingController.text));
                  _textEditingController.clear();
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  void toggleTodoCompletion(int index) {
    setState(() {
      todos[index].completed = !todos[index].completed;
    });
  }

  void deleteTodoAtIndex(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }
}
