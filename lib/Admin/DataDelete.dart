import 'package:flutter/material.dart';

class ManageStadiumsScreen extends StatefulWidget {
  final List<Map<String, dynamic>> stadiums;
  final Function(int) onDelete;

  const ManageStadiumsScreen({
    super.key,
    required this.stadiums,
    required this.onDelete,
  });

  @override
  State<ManageStadiumsScreen> createState() => _ManageStadiumsScreenState();
}

class _ManageStadiumsScreenState extends State<ManageStadiumsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Stadiums'),
        backgroundColor: Color(0xFF030E2F),
      ),
      backgroundColor: Color(0xFF030E2F),
      body: ListView.builder(
        itemCount: widget.stadiums.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text(widget.stadiums[index]["text"]),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    widget.onDelete(index);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
