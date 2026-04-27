import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tareas extends StatefulWidget {
  const Tareas({super.key});

  @override
  State<Tareas> createState() => _TareasState();
}

class _TareasState extends State<Tareas> {
  // List to store tasks
  List<String> todoList = [];

  // Controller for text input
  final TextEditingController _controller = TextEditingController();

  // Index to track which task is being edited
  int updateIndex = -1;

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      todoList = prefs.getStringList('tasks') ?? [];
    });
  }

  saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setStringList('tasks', todoList);
    });
  }

  // Function to add a new task to the list
  addList(String task) {
    setState(() {
      todoList.add(task);
      _controller.clear();
    });
    saveTasks();
  }

  // Function to update an existing task
  updateListItem(String task, int index) {
    setState(() {
      todoList[index] = task;

      // Reset update index
      updateIndex = -1;
      _controller.clear();
    });
    saveTasks();
  }

  // Function to delete a task
  deleteItem(index) {
    setState(() {
      todoList.removeAt(index);
    });
    saveTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          "Tareas",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),

        // Centers the app bar title
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 90,
              child: ListView.builder(
                // Number of tasks in the list
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),

                    // Card background color
                    color: const Color.fromARGB(255, 132, 132, 132),
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 80,
                            child: Text(
                              // Display the task text
                              todoList[index],
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),

                          // Edit button
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _controller.clear();
                                _controller.text = todoList[index];
                                updateIndex = index;
                              });
                            },
                            icon: Icon(
                              Icons.edit,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),

                          // Delete button
                          IconButton(
                            onPressed: () {
                              deleteItem(index);
                            },
                            icon: Icon(
                              Icons.delete,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded(
                    flex: 70,
                    child: SizedBox(
                      height: 60,
                      child: TextFormField(
                        // Input field controller
                        controller: _controller,
                        decoration: InputDecoration(
                          filled: false,

                          // Placeholder text
                          labelText: 'Create Task....',
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),

                  // Floating action button for adding/updating tasks
                  FloatingActionButton(
                    // backgroundColor: Colors.green,
                    // foregroundColor: Colors.white,
                    onPressed: () {
                      updateIndex != -1
                          ? updateListItem(
                              _controller.text,
                              updateIndex,
                            ) // Update task if editing
                          : addList(_controller.text); // Add new task
                    },
                    child: Icon(
                      updateIndex != -1 ? Icons.edit : Icons.add,
                    ), // Icon changes based on action
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
