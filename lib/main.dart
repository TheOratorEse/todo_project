import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: TodoScreen()));
}

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  String _todoInput = ''; //user input state object
  List<String> _todoList = []; //user list of input object
  //method to add tasks to the todo List object
  void addTodo() {
    setState(() {
      _todoList.add(_todoInput);
      textController.clear();

      //collect the todo input and added it to the end of the list: TodoList
    });
  }
  //method to delete tasks to the todo List object

  void deleteTodo(index) {
    setState(() {
      _todoList.removeAt(index);
      //removing the todo items from position in the list
    });
  }

  var textController = TextEditingController(); //controller for text controls

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Todo App', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),

      drawer: Drawer(
        backgroundColor: Colors.white70,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.purple),
              child: Text('My Menu', style: TextStyle(color: Colors.white)),
            ),

            ListTile(
              leading: Icon(Icons.task_outlined, color: Colors.purple.shade700),
              title: Text('All tasks', style: TextStyle(color: Colors.purple)),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.person_outlined,
                color: Colors.purple.shade700,
              ),
              title: Text('Profile', style: TextStyle(color: Colors.purple)),
            ),
            ListTile(
              leading: Icon(
                Icons.settings_outlined,
                color: Colors.purple.shade700,
              ),
              title: Text('Settings', style: TextStyle(color: Colors.purple)),
            ),
          ],
        ),
      ),

      body: Column(
        spacing: 20,
        children: [
          Container(
            alignment: Alignment.center,
            height: 100,
            width: MediaQuery.sizeOf(context).width * 8.0,
            decoration: BoxDecoration(color: Colors.purple.shade300),
            child: Text(
              'Welcome to Task Manager app, easily manage your tasks here',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),

          TextField(
            controller: textController,
            onChanged: (text) {
              _todoInput = text;
            },
            decoration: InputDecoration(
              label: Text('Enter Task', style: TextStyle(color: Colors.purple)),
              hint: Text(
                'type in your task here',
                style: TextStyle(color: Colors.purple.shade700),
              ),
              suffixIcon: FilledButton(
                onPressed: addTodo,
                style: FilledButton.styleFrom(backgroundColor: Colors.purple),
                child: Text('Add Task'),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: _todoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    _todoList[index],
                    style: TextStyle(color: Colors.purple.shade700),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      deleteTodo(index);
                    },
                    icon: Icon(
                      Icons.delete_outlined,
                      color: Colors.purple.shade700,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: Colors.purple),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined, color: Colors.purple),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
