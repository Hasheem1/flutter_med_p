
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName(this.documentId, {super.key});

  final Color backgroundColor = const Color(0xFF030E2F);
  final Color accentColor = const Color(0xFF94e3a8);
  final Color textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('userCollection');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;

          return Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 0),
                    Text(
                      "Your Information",
                      style: TextStyle(
                        color: accentColor,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 40),
                    buildInfoTile(context, "name", data['name']),
                    buildInfoTile(context, "age", data['age'].toString()),
                    buildInfoTile(context, "position", data['position']),
                    buildInfoTile(context, "Rate", data['Rate'].toString()),
                    buildInfoTile(context, "State", data['State'].toString()),
                  ],
                ),
              ),
            ),
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget buildInfoTile(BuildContext context, String label, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: accentColor, width: 3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              "$label:",
              style: TextStyle(
                color: accentColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: TextStyle(
                color: textColor,
                fontSize: 20,
              ),
              textAlign: TextAlign.right,
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () {
                showEditDialog(context, label, value);
              },
              icon: Icon(Icons.mode, color: accentColor),
            ),
          ),
        ],
      ),
    );
  }

  void showEditDialog(BuildContext context, String field, String oldValue) {
    final TextEditingController controller = TextEditingController(text: oldValue);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Update $field"),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: "Enter new $field",
            border: const OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              String newValue = controller.text.trim();
              if (newValue.isNotEmpty) {
                await FirebaseFirestore.instance
                    .collection('userCollection')
                    .doc(documentId)
                    .update({field: _castValue(field, newValue)});
                Navigator.pop(context);
              }
            },
            child: const Text("Update"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }

  dynamic _castValue(String field, String value) {
    if (field.toLowerCase() == "age" || field.toLowerCase() == "rate") {
      return int.tryParse(value) ?? value;
    }
    return value;
  }
}
