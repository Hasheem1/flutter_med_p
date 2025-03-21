import 'package:flutter/material.dart';

class Addstadium extends StatefulWidget {
  const Addstadium({super.key});

  @override
  State<Addstadium> createState() => _AddstadiumState();
}

class _AddstadiumState extends State<Addstadium> {
  String stadiumName = '';
  String imageUrl = '';

  void _showAddStadiumDialog() {
    TextEditingController nameController = TextEditingController();
    TextEditingController linkController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add Stadium"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Stadium Name"),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: linkController,
                decoration: const InputDecoration(labelText: "Image Link"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  stadiumName = nameController.text;
                  imageUrl = linkController.text;
                });
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF030E2F),
      appBar: AppBar(title: const Text("Add Stadium")),
      body: Center(
        child: stadiumName.isEmpty
            ? const Text(
          "No stadium added yet",
          style: TextStyle(color: Colors.white),
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              stadiumName,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 10),
            imageUrl.isNotEmpty
                ? Image.network(imageUrl, height: 200)
                : const Text("No image provided",
                style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddStadiumDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
