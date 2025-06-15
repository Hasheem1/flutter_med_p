import 'package:flutter/material.dart';

class AddStadiumScreen extends StatefulWidget {
  @override
  _AddStadiumScreenState createState() => _AddStadiumScreenState();
}

class _AddStadiumScreenState extends State<AddStadiumScreen> {
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final List<Map<String, dynamic>> stadiums = [];

  void _addStadium() {
    if (_imageController.text.isEmpty || _nameController.text.isEmpty) return;

    setState(() {
      stadiums.add({
        "networkImage": _imageController.text,
        "text": _nameController.text,
        "targetScreen": Placeholder(),
        "isFavorite": false,
      });
    });

    _imageController.clear();
    _nameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Stadium')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _imageController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Stadium Name'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addStadium,
              child: Text('Add Stadium'),
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: stadiums.length,
                itemBuilder: (context, index) {
                  final stadium = stadiums[index];
                  return ListTile(
                    leading: Image.network(
                      stadium['networkImage'],
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(stadium['text']),
                    trailing: IconButton(
                      icon: Icon(
                        stadium['isFavorite']
                            ? Icons.favorite
                            : Icons.favorite_border,
                      ),
                      onPressed: () {
                        setState(() {
                          stadium['isFavorite'] = !stadium['isFavorite'];
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
