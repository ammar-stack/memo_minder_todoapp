import 'package:flutter/material.dart';
import 'package:notes_app/models/task.dart';
import 'package:notes_app/services/database_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DatabaseService _databaseService =
      DatabaseService.instance; //getting access to the class
  String? _task;
  final TextEditingController _taskController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 112, 111, 111),
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Text(
          "Memo Minder",
          style: TextStyle(
              fontFamily: 'Nerko One', fontSize: 40, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 6, right: 6),
        child: _taskList(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                    title: const Text("Add Task"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              _task = value;
                            });
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Add Task'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: const RoundedRectangleBorder()),
                              onPressed: () {
                                if (_task == null || _task == "") {
                                  return; //return if task is empty
                                }
                                _databaseService.addTask(_task!);
                                setState(() {
                                  _task = null;
                                });

                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Save",
                                style: TextStyle(color: Colors.white),
                              )),
                        )
                      ],
                    ),
                  ));
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _taskList() {
    return FutureBuilder(
        future: _databaseService.getTask(),
        builder: (context, snapshot) {
          return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                //using model
                Task task = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: ListTile(
                      shape: const RoundedRectangleBorder(),
                      selectedTileColor: Colors.orange.shade100,
                       onTap: () {
                        // Pre-fill the text field with the current task content
                        _taskController.text = task.content;

                        // Show dialog to edit task
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  title: const Text("Edit Task"),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        controller: _taskController,
                                        onChanged: (value) {
                                          setState(() {
                                            _task = value;
                                          });
                                        },
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Edit Task'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.black,
                                                shape:
                                                    const RoundedRectangleBorder()),
                                            onPressed: () {
                                              if (_task == null || _task!.isEmpty) return; // Return if task is empty

                                              // Call the update function with the task ID and updated content
                                              _databaseService.updateTaskContent(task.id, _task!);
                                              setState(() {
                                                _task = null;
                                                _taskController.clear(); // Clear the controller after saving
                                              });

                                              Navigator.pop(context); // Close the dialog
                                            },
                                            child: const Text(
                                              "Update",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                      )
                                    ],
                                  ),
                                ));
                      },
                      onLongPress: () {
                        _databaseService.deleteTask(task.id);
                        setState(() {});
                      },
                      title: Text(task.content,
                          style: task.isCompleted == 1
                              ? const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontFamily: 'Nerko One',
                                  fontSize: 30)
                              : const TextStyle(
                                  fontFamily: 'Nerko One', fontSize: 30)),
                      trailing: Checkbox(
                          value: task.isCompleted == 1,
                          onChanged: (value) {
                            _databaseService.updateTaskStatus(
                                task.id, value == true ? 1 : 0);
                            setState(() {});
                          }),
                    ),
                  ),
                );
              });
        });
  }
}
