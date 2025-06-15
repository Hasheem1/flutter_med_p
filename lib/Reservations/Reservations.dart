import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ReservationScreen extends StatefulWidget {
  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  final Map<String, Map<String, Map<String, List<String>>>> availability = {
    'Stadium A': {
      '15/6': {
        'hours': ['10:00 AM', '1:00 PM'],
        'years': ['2025'],
      },
      '16/6': {
        'hours': ['2:00 PM', '4:00 PM'],
        'years': ['2025'],
      },
    },
    'Stadium B': {
      '17/6': {
        'hours': ['12:00 PM', '3:00 PM'],
        'years': ['2025'],
      },
    },
    'Stadium C': {
      '18/6': {
        'hours': ['9:00 AM', '6:00 PM'],
        'years': ['2025'],
      },
    },
  };

  String selectedStadium = 'Stadium A'; // Default stadium
  String? selectedDay;
  String? selectedHour;
  String? selectedYear;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String? userEmail = FirebaseAuth.instance.currentUser?.email;

  @override
  Widget build(BuildContext context) {
    List<String> days = availability[selectedStadium]!.keys.toList();
    List<String> hours = (selectedDay != null)
        ? availability[selectedStadium]![selectedDay]!['hours']!
        : [];
    List<String> years = (selectedDay != null)
        ? availability[selectedStadium]![selectedDay]!['years']!
        : [];

    return Scaffold(
      backgroundColor: Color(0xFF030E2F),
      appBar: AppBar(
        backgroundColor: Color(0xFF030E2F),
        iconTheme: IconThemeData(color: Colors.white, size: 30),
        title: Text(
          'Reservations',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
        child: Column(
          children: [
            // Removed stadium selection dropdown

            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Select Day',
                labelStyle: TextStyle(color: Colors.white, fontSize: 23),
              ),
              value: selectedDay,
              items: days.map((day) {
                return DropdownMenuItem(
                  value: day,
                  child: Text(day, style: TextStyle(color: Color(0xFF94e3a8))),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedDay = value;
                  selectedHour = null;
                  selectedYear = null;
                });
              },
            ),
            SizedBox(height: 30),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Select Hour',
                labelStyle: TextStyle(color: Colors.white, fontSize: 23),
              ),
              value: selectedHour,
              items: hours.map((hour) {
                return DropdownMenuItem(
                  value: hour,
                  child: Text(hour, style: TextStyle(color: Color(0xFF94e3a8))),
                );
              }).toList(),
              onChanged: (value) => setState(() => selectedHour = value),
            ),
            SizedBox(height: 30),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Select Year',
                labelStyle: TextStyle(color: Colors.white, fontSize: 23),
              ),
              value: selectedYear,
              items: years.map((year) {
                return DropdownMenuItem(
                  value: year,
                  child: Text(year, style: TextStyle(color: Color(0xFF94e3a8))),
                );
              }).toList(),
              onChanged: (value) => setState(() => selectedYear = value),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF94e3a8)),
              onPressed: () async {
                if (selectedDay != null && selectedHour != null && selectedYear != null) {
                  await addReservation();

                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('Reservation Confirmed'),
                      content: Text(
                        'Stadium: $selectedStadium\nDay: $selectedDay\nHour: $selectedHour\nYear: $selectedYear',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        )
                      ],
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please select all fields')),
                  );
                }
              },
              child: Text('Confirm Reservation', style: TextStyle(color: Colors.white, fontSize: 20)),
            )
          ],
        ),
      ),
    );
  }

  Future<void> addReservation() async {
    if (selectedDay == null || selectedHour == null || selectedYear == null || selectedStadium == null) return;

    // Convert day (e.g. 15/6) into full date string (e.g. 2025-06-15)
    List<String> dayParts = selectedDay!.split('/');
    String formattedDate =
        '${selectedYear!}-${dayParts[1].padLeft(2, '0')}-${dayParts[0].padLeft(2, '0')}';

    Map<String, dynamic> reservationData = {
      'stadiumId': selectedStadium,
      'day': formattedDate,
      'time': selectedHour,
      'year': selectedYear,
      'price': 50,
      'status': 'confirmed',
    };

    try {
      // Get existing reservations count
      final reservationCollection = firestore
          .collection('userCollection')
          .doc(userEmail)
          .collection('reservation');

      final snapshot = await reservationCollection.get();
      int reservationCount = snapshot.docs.length;

      // Create new document with name like 'reservation1', 'reservation2', etc.
      String newDocName = 'reservation${reservationCount + 1}';

      await reservationCollection.doc(newDocName).set(reservationData);
      print('Reservation added as $newDocName');
    } catch (error) {
      print('Failed to add reservation: $error');
    }
  }

}
