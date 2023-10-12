import 'package:flutter/material.dart';

import '../models/todo_model.dart';

// This class is to dislay the ToDO UI on the dashboard  screen
class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<TodoItem> todos = [];
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1D3461),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Column(
            children: [
              displayTodoListBuilder(),
              blankTaskTile(),
            ],
          ),
        ),
      ),
    );
  }

  // This method is to display the To-Do listview
  Widget displayTodoListBuilder() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ListTile(
            dense: true,
            leading: Checkbox(
              side: const BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
              activeColor: Colors.blue,
              checkColor: Colors.white,
              value: todos[index].completed,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              onChanged: (value) {
                todoComplete(index);
              },
            ),
            title: Text(
              todos[index].title,
              style: TextStyle(
                fontSize: 16,
                color: todos[index].completed ? Colors.red : Colors.white,
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
          ),
        );
      },
    );
  }

  // This method is to display the blank listtile for the to-do
  Widget blankTaskTile() {
    return ListTile(
      dense: true,
      leading: Checkbox(
        side: const BorderSide(
          color: Colors.white,
          width: 2.0,
        ),
        checkColor: Colors.white,
        activeColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        value: false,
        onChanged: (value) {},
      ),
      title: TextField(
        style: const TextStyle(color: Colors.white),
        controller: textController,
        decoration: const InputDecoration(
          focusColor: Colors.white,
          hintStyle: TextStyle(color: Colors.white),
          hintText: 'Add your task',
        ),
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.add_circle_outline_outlined,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            if (textController.text.isNotEmpty) {
              todos.add(TodoItem(title: textController.text));
            }
            textController.clear();
          });
        },
      ),
    );
  }

  // This method is to record if the to-do has been completed
  void todoComplete(int index) {
    setState(() {
      todos[index].completed = !todos[index].completed;
    });
  }

  // This method is to delete the to-do
  void deleteTodoAtIndex(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }
}
