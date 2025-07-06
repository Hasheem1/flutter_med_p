import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ReservationScreen extends StatefulWidget {
  String? selectedStadium;
  ReservationScreen(this.selectedStadium);
  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  final Map<String, Map<String, Map<String, List<String>>>> availability = {
    'Hashem Stadium': {
      '15/6': {
        'hours': ['10:00 AM - 11:30 AM', '1:00 PM - 2:30 PM'],
        'years': ['2025'],
        'price': ['2 JD']
      },
      '16/6': {
        'hours': ['2:00 PM - 3:30 PM', '4:00 PM - 5:30 PM'],
        'years': ['2025'],
        'price': ['2 JD']
      },
    },
    'Toledo Stadium': {
      '17/6': {
        'hours': ['12:00 PM - 1:30 PM', '3:00 PM - 4:30 PM'],
        'years': ['2025'],
        'price': ['3 JD']
      },
    },
    'Yarmouk Stadium': {
      '18/6': {
        'hours': ['9:00 AM - 10:30 AM', '6:00 PM - 7:30 PM'],
        'years': ['2025'],
        'price': ['2.5 JD']
      },
    },
  };

  late String selectedStadium;
  String? selectedDay;
  String? selectedHour;
  String? selectedYear;
  String? selectedPrice;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String? userEmail = FirebaseAuth.instance.currentUser?.email;

  @override
  void initState() {
    super.initState();
    selectedStadium = widget.selectedStadium ?? '';
  }

  @override
  Widget build(BuildContext context) {
    List<String> days = availability[selectedStadium]!.keys.toList();
    List<String> hours = (selectedDay != null)
        ? availability[selectedStadium]![selectedDay]!['hours']!
        : [];
    List<String> years = (selectedDay != null)
        ? availability[selectedStadium]![selectedDay]!['years']!
        : [];
    List<String> price = (selectedDay != null)
        ? availability[selectedStadium]![selectedDay]!['price']!
        : [];

    return Scaffold(
      backgroundColor: Color(0xFF030E2F),
      appBar: AppBar(
        backgroundColor: Color(0xFF030E2F),
        iconTheme: IconThemeData(color: Colors.white, size: 30,),
        title: Text('Reservations',
            style: TextStyle(color: Colors.white, fontSize: 30)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
        child: Column(
          children: [
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
                  selectedPrice = null;
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
            SizedBox(height: 30),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Price',
                labelStyle: TextStyle(color: Colors.white, fontSize: 23),
              ),
              value: selectedPrice,
              items: price.map((p) {
                return DropdownMenuItem(
                  value: p,
                  child: Text(p, style: TextStyle(color: Color(0xFF94e3a8))),
                );
              }).toList(),
              onChanged: (value) => setState(() => selectedPrice = value),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF94e3a8)),
              onPressed: () async {
                if (selectedDay != null &&
                    selectedHour != null &&
                    selectedYear != null &&
                    selectedPrice != null) {
                  await addReservation();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please select all fields')),
                  );
                }
              },
              child: Text('Confirm Reservation',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            )
          ],
        ),
      ),
    );
  }

  Future<void> addReservation() async {
    if (selectedDay == null ||
        selectedHour == null ||
        selectedYear == null ||
        selectedStadium.isEmpty ||
        selectedPrice == null) return;

    List<String> dayParts = selectedDay!.split('/');
    String formattedDate =
        '${selectedYear!}-${dayParts[1].padLeft(2, '0')}-${dayParts[0].padLeft(2, '0')}';

    String sharedSlotId = '${selectedStadium}_$formattedDate\_$selectedHour';
    final sharedSlotDoc = firestore.collection('shared_reservations').doc(sharedSlotId);

    try {
      await firestore.runTransaction((transaction) async {
        // Step 1: Check if user already booked the same slot
        final reservationCollection = firestore
            .collection('userCollection')
            .doc(userEmail)
            .collection('reservation');

        final existingReservationQuery = await reservationCollection
            .where('stadiumId', isEqualTo: selectedStadium)
            .where('day', isEqualTo: formattedDate)
            .where('time', isEqualTo: selectedHour)
            .where('year', isEqualTo: selectedYear)
            .get();

        if (existingReservationQuery.docs.isNotEmpty) {
          throw Exception('You have already booked this time slot.');
        }

        // Step 2: Check current number of players
        final snapshot = await transaction.get(sharedSlotDoc);
        int currentCount = 0;
        if (snapshot.exists) {
          currentCount = snapshot.data()?['players_counter'] ?? 0;
        }

        if (currentCount == 12) {
          throw Exception('This slot is fully booked (12 players).');
        }

        // Step 3: Proceed with booking
        transaction.set(
          sharedSlotDoc,
          {'players_counter': currentCount + 1},
          SetOptions(merge: true),
        );

        Map<String, dynamic> reservationData = {
          'stadiumId': selectedStadium,
          'day': formattedDate,
          'time': selectedHour,
          'year': selectedYear,
          'price': selectedPrice,
          'status': 'confirmed',
          'user time booked': DateTime.now(),
          'players counter': currentCount + 1,
        };

        final userSnapshot = await reservationCollection.get();
        int reservationCount = userSnapshot.docs.length;
        String newDocName = 'match${reservationCount + 1}';

        transaction.set(
          reservationCollection.doc(newDocName),
          reservationData,
        );
      });

      // Show confirmation dialog
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Reservation Confirmed'),
          content: Text(
            'Stadium: $selectedStadium\nDay: $selectedDay\nHour: $selectedHour\nYear: $selectedYear\nPrice: $selectedPrice',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            )
          ],
        ),
      );

      print('Reservation completed.');
    } catch (error) {
      print('Reservation failed: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

}
