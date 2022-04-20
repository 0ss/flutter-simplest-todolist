// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mytodolist/heading.dart';
import 'todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);
  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Todo> todos = [
    Todo(title: "work in flutter", isDone: true),
  ];
  TextEditingController controller = TextEditingController();

  void _toggleTodo(Todo todo, bool? isChecked) {
    print('${todo.title} ${todo.isDone}');
    setState(() {
      todo.isDone = isChecked!;
    });
  }

  void addTodo(Todo todo) {
    setState(() {
      todos.add(todo);
    });
  }

  void removeTodo(Todo todo) {
    setState(() {
      todos.remove(todo);
    });
  }

  Widget _buildItem(BuildContext context, int index) {
    final todo = todos[index];
    return Row(
      children: [
        Text(
          todo.title,
          style: TextStyle(
              color: todo.isDone ? Colors.grey : Colors.black,
              decoration: todo.isDone
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
        ),
        Spacer(),
        Checkbox(
            value: todo.isDone,
            onChanged: (bool? isChecked) {
              _toggleTodo(todo, isChecked);
            }),
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            removeTodo(todo);
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(children: [
          SizedBox(height: 10),
          Heading(),
          Expanded(
              child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: _buildItem,
            itemCount: todos.length,
          ))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Add todo"),
                  content: TextField(
                    controller: controller,
                    autofocus: true,
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          addTodo(Todo(
                              title: controller.value.text, isDone: false));
                          controller.clear();
                          Navigator.of(context).pop();
                        },
                        child: Text("Add")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Cancel"))
                  ],
                );
              });
        },
      ),
    );
  }
}
