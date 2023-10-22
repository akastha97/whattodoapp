import 'package:flutter/material.dart';
import 'package:whattodo_final/manager/hive_manager.dart';
import 'package:whattodo_final/ui_components/custom_appbar.dart';

import '../models/todo_model.dart';

// This class is to dislay the ToDO UI on the dashboard  screen
class TodoScreen extends StatefulWidget {
  final String category;

  const TodoScreen({super.key, required this.category});
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<TodoItem> todos = [];
  final TextEditingController textController = TextEditingController();
  HiveManager manager = HiveManager();

  @override
  void initState() {
    super.initState();

    print("initState called");
    // Load Todo data when the screen is initialized
    manager.loadTodoDataForCategory(widget.category);

    setState(() {
      todos = manager.getDefaultTodoDataForCategory(widget.category);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        headText: widget.category,
        showHeadText: true,
        isDisplay: true,
        customAction: () {
          // go back to previous screen
          // nothing required now
        },
        showBackButton: true,
      ),
      backgroundColor: Color(0xff1D3461),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Column(
            children: [
              displayTodoListBuilder(),
              addTodoListtile(),
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
          child: Container(
            
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white)),
            child: Card(
              color: Color(0xffC0CFEC),
              child: ListTile(
                dense: true,
                leading: Checkbox(
                  side: const BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                  activeColor: Colors.red,
                  checkColor: Colors.white,
                  value: todos[index].completed,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  onChanged: (value) {
                    print("Checkbox tapped: $value");
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
                    Icons.delete,
                    color: Colors.red[200],
                  ),
                  onPressed: () {
                    deleteTodoAtIndex(index);
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // This method is to display the to do listtile
  Widget addTodoListtile() {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white)),
      child: Card(
        color: Color(0xffC0CFEC),
        child: ListTile(
          dense: true,
          leading: Checkbox(
            side: const BorderSide(
              color: Color(0xffC0CFEC),
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
              border: InputBorder.none,
              focusColor: Color(0xffC0CFEC),
              hintStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
              hintText: 'Add your task',
            ),
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.add_task,
              size: 26,
              color: Color(0xffF8BEE2),
            ),
            onPressed: () {
              addTodo();
            },
          ),
        ),
      ),
    );
  }

  // This method is to record if the to-do has been completed
  void todoComplete(int index) {
    setState(() {
      todos[index].completed = !todos[index].completed;
      //print(todos[index].completed = !todos[index].completed);
      print("Checkbox tapped: ${todos[index].completed}");
      List<TodoItem> updatedTodoItems = List.from(todos);
      manager.updateTodoItemsForCategory(widget.category, updatedTodoItems);
    });
  }

  // This method is to delete the to-do
// This method is to delete the to-do
  void deleteTodoAtIndex(int index) {
    setState(() {
      if (index >= 0 && index < todos.length) {
        todos.removeAt(index);
        manager.updateTodoItemsForCategory(widget.category, todos);
        print(todos);
      }
    });
  }

  void addTodo() {
    if (textController.text.isNotEmpty) {
      TodoItem newTodo = TodoItem(title: textController.text);

      setState(() {
        todos.add(newTodo);
      });

      manager.updateTodoItemsForCategory(widget.category, todos);
      textController.clear();
    }
  }
}
