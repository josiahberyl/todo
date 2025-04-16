import 'package:flutter/material.dart';
import 'second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> taskList = [];
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set background to black
      appBar: AppBar(
        title: const Text('Home Workout', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.red, // Red background for app bar
        actions: const [
          Icon(Icons.notifications, color: Colors.white),
          SizedBox(width: 10),
          Icon(Icons.logout_rounded, color: Colors.white),
          SizedBox(width: 10),
          Icon(Icons.help, color: Colors.white),
        ],
      ),
      body: Column(
        children: [
          // Text Field Row
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: textController,
                    decoration: const InputDecoration(
                      label: Text("Today's Workout", style: TextStyle(color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.redAccent),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white), // White text for the input
                  ),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  if (textController.text.isNotEmpty) {
                    setState(() {
                      taskList.add(textController.text);
                      textController.clear();
                    });
                  }
                },
                color: Colors.redAccent,
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text("ADD", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Flexible(
            child: ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        color: Colors.redAccent, // Red container for each task
                        padding: const EdgeInsets.all(10),
                        child: Text(taskList[index], style: const TextStyle(color: Colors.white)),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.white),
                      onPressed: () {
                        setState(() {
                          taskList.removeAt(index);
                        });
                      },
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent, // Red button
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text("Go to Next Page", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
