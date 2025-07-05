import 'package:flutter/material.dart';

class RulesBookScreen extends StatelessWidget {
  final Color backgroundColor = const Color(0xFF030E2F);
  final Color accentColor = const Color(0xFF94e3a8);
  final Color textColor = Colors.white;

  final List<String> rules = [
    "1. Respect the stadium property at all times.",
    "2. Arrive 15 minutes before your reserved time slot.",
    "3. No food or drinks allowed on the field.",
    "4. Only registered users can make reservations.",
    "5. Cancellations must be made at least 2 hours in advance.",
    "6. Players must wear proper sports attire.",
    "7. Smoking and alcohol are strictly prohibited.",
    "8. Keep the noise level appropriate during games.",
    "9. The stadium has the right to cancel bookings for maintenance or emergencies.",
    "10. Violating rules may lead to account suspension.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text("Rules Book", style: TextStyle(color: accentColor)),
        centerTitle: true,
        iconTheme: IconThemeData(color: accentColor),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: rules.length,
          separatorBuilder: (context, index) => Divider(color: accentColor.withOpacity(0.3)),
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.rule, color: accentColor),
              title: Text(
                rules[index],
                style: TextStyle(color: textColor, fontSize: 16),
              ),
            );
          },
        ),
      ),
    );
  }
}
