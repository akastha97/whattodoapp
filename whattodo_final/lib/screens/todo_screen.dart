import 'package:flutter/material.dart';
import 'package:whattodo_final/consts.dart';
import 'package:whattodo_final/manager/hive_manager.dart';
import 'package:whattodo_final/ui_components/custom_appbar.dart';

import '../models/todo_model.dart';

// This class is to dislay the ToDo screen
// where the user can add, remove the todos

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
          // nothing required
        },
        showBackButton: true,
      ),
      backgroundColor: Color(0xff1D3461),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              displayTodoListBuilder(),
              addTodoListtile(),
            ],
          ),
        ),
      ),
    );
  }

  // This method is to display the To-Do listview builder
  // to show all the Todo listview items.
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
                    color: Colors.pink,
                    width: 2.5,
                  ),
                  activeColor: Colors.pink,
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
                    fontWeight: FontWeight.w500,
                    color: todos[index].completed ? Colors.red : Colors.black,
                    decoration: todos[index].completed
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
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

  // This method is to display the to do the empty Listtile
  // where user can enter the Todo and add it to the todo list
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
                color: Colors.pink,
                width: 2.5,
              ),
              activeColor: Colors.pink,
              checkColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              value: false,
              onChanged: null),
          title: TextField(
            autocorrect: false,
            cursorColor: Colors.black,
            style: const TextStyle(color: Colors.black),
            controller: textController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              focusColor: Color(0xffC0CFEC),
              hintStyle: TextStyle(
                  color: Colors.black26,
                  fontWeight: FontWeight.w100,
                  fontStyle: FontStyle.italic),
              hintText: AppConstants.hintText,
            ),
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.add_task,
              size: 26,
              color: Colors.pink,
            ),
            onPressed: () {
              addTodo();
            },
          ),
        ),
      ),
    );
  }

  // This method is to record if the to-do has been completed or not
  // also updating the Hive box.
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
  // and then to update the Hive box
  void deleteTodoAtIndex(int index) {
    setState(() {
      if (index >= 0 && index < todos.length) {
        todos.removeAt(index);
        manager.updateTodoItemsForCategory(widget.category, todos);
        print(todos);
      }
    });
  }

  // This method is to add the new todo to the todo list items
  // along with updating the Hive box
  // then clearing the textfield
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
