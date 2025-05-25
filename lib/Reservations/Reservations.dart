import 'package:flutter/material.dart';

class ReservationScreen extends StatefulWidget {
  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  final Map<String, Map<String, List<String>>> availability = {
    'Monday': {
      'hours': ['10:00 AM', '1:00 PM'],
      'years': ['2025', '2026'],
    },
    'Tuesday': {
      'hours': ['12:00 PM', '3:00 PM'],
      'years': ['2025'],
    },
    'Friday': {
      'hours': ['4:00 PM', '6:00 PM'],
      'years': ['2025', '2027'],
    },
  };

  String? selectedDay;
  String? selectedHour;
  String? selectedYear;

  @override
  Widget build(BuildContext context) {
    List<String> hours = selectedDay != null
        ? availability[selectedDay]!['hours']!
        : [];
    List<String> years = selectedDay != null
        ? availability[selectedDay]!['years']!
        : [];

    return Scaffold(backgroundColor: Color(0xFF030E2F),
      appBar: AppBar(backgroundColor: Color(0xFF030E2F),iconTheme: IconThemeData(color: Colors.white, size: 30),
        title: Text('Reservations',style: TextStyle(color: Colors.white,fontSize: 30),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20 ,vertical:100 ),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Select Day',labelStyle: TextStyle(color: Colors.white,fontSize: 23)),
              value: selectedDay,
              items: availability.keys
                  .map((day) => DropdownMenuItem(
                value: day,
                child: Text(day,style: TextStyle(color: Color(0xFF94e3a8)),),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedDay = value;
                  selectedHour = null;
                  selectedYear = null;
                });
              },
            ),
            SizedBox(height: 50),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Select Hour',labelStyle: TextStyle(color: Colors.white,fontSize: 23)),
              value: selectedHour,
              items: hours
                  .map((hour) => DropdownMenuItem(
                value: hour,
                child: Text(hour,style: TextStyle(color: Color(0xFF94e3a8)),),
              ))
                  .toList(),
              onChanged: selectedDay == null
                  ? null
                  : (value) => setState(() => selectedHour = value),
            ),
            SizedBox(height: 50),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Select Year',labelStyle: TextStyle(color: Colors.white,fontSize: 23)),
              value: selectedYear,
              items: years
                  .map((year) => DropdownMenuItem(
                value: year,
                child: Text(year,style: TextStyle(color: Color(0xFF94e3a8)),),
              ))
                  .toList(),
              onChanged: selectedDay == null
                  ? null
                  : (value) => setState(() => selectedYear = value),
            ),
            SizedBox(height: 40),
            ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF94e3a8)),
              onPressed: () {
                if (selectedDay != null &&
                    selectedHour != null &&
                    selectedYear != null) {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('Reservation Confirmed'),
                      content: Text(
                          'Day: $selectedDay\nHour: $selectedHour\nYear: $selectedYear'),
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
                    SnackBar(
                      content: Text('Please select all fields'),
                    ),
                  );
                }
              },
              child: Text('Confirm Reservation',style:TextStyle(color: Colors.white,fontSize: 20),),
            )
          ],
        ),
      ),
    );
  }
}
