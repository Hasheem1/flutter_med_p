import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ReservationBooked extends StatelessWidget {
  final String userEmail;

  ReservationBooked({required this.userEmail});

  Future<List<Map<String, dynamic>>> getReservationDetails(String userEmail) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      final reservationCollection = firestore
          .collection('userCollection')
          .doc(userEmail)
          .collection('reservation');

      final snapshot = await reservationCollection.get();

      List<Map<String, dynamic>> reservations = snapshot.docs
          .map((doc) => doc.data())
          .toList();

      return reservations;
    } catch (error) {
      print('Failed to retrieve reservation details: $error');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF030E2F),
      appBar: AppBar(
        backgroundColor: Color(0xFF030E2F),
        iconTheme: IconThemeData(color: Colors.white),
        title: Center(
          child: Text(
            'Reservations',
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: getReservationDetails(userEmail),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: Colors.white));
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading reservations', style: TextStyle(color: Colors.white)));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No reservations found', style: TextStyle(color: Colors.white)));
          }

          final reservations = snapshot.data!;

          return ListView.builder(
            itemCount: reservations.length,
            itemBuilder: (context, index) {
              final res = reservations[index];

              return Center(
                child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                  color: Color(0xFF94e3a8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Reservation ${index + 1}',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF030E2F),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        if (res.containsKey('stadiumId'))
                          Text('🆔 Stadium: ${res['stadiumId']}', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
                        if (res.containsKey('stadium'))
                          Text('🏟 Stadium: ${res['stadium']}', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
                        if (res.containsKey('day'))
                          Text('📅 Day: ${res['day']}', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
                        if (res.containsKey('state'))
                          Text('📍 State: ${res['state']}', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
                        if (res.containsKey('time'))
                          Text('⏰ Time: ${res['time']}', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
                        if (res.containsKey('year'))
                          Text('📆 Year: ${res['year']}', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
                        if (res.containsKey('price'))
                          Text('💰 Price: ${res['price']}', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
                        if (res.containsKey('players counter'))
                          Text('👥 Players number: ${res['players counter']}', style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
