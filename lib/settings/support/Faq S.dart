import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  final Color backgroundColor = const Color(0xFF030E2F);
  final Color accentColor = const Color(0xFF94e3a8);
  final Color textColor = Colors.white;

  final List<Map<String, String>> faqs = [
    {
      "question": "What is this app used for?",
      "answer": "This app allows users to browse, reserve, and manage stadium bookings easily."
    },
    {
      "question": "How do I make a reservation?",
      "answer": "Choose a stadium, select a date and time, then confirm your reservation."
    },
    {
      "question": "Can I cancel or modify a reservation?",
      "answer": "Yes, go to 'My Reservations', select the booking, and choose Edit or Cancel."
    },
    {
      "question": "Is there a fee for making a reservation?",
      "answer": "Some stadiums may charge a fee depending on time, date, and location."
    },
    {
      "question": "Do I need to create an account?",
      "answer": "Yes. Signing up ensures secure access and helps manage your bookings."
    },
    {
      "question": "What if the stadium I want is not available?",
      "answer": "Try a different stadium or time, or set a notification for availability."
    },
    {
      "question": "Can I book for multiple dates or time slots?",
      "answer": "Currently, bookings are made one at a time. Bulk booking is coming soon."
    },
    {
      "question": "How can I contact support?",
      "answer": "Visit the Contact Us page or email support@stadiumreserve.com."
    },
    {
      "question": "What happens if I don’t show up?",
      "answer": "No-shows may result in fees or restrictions based on stadium policies."
    },
    {
      "question": "Is my data safe?",
      "answer": "Yes. We use secure authentication and encrypted storage for your data."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text("FAQs", style: TextStyle(color: accentColor)),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: accentColor),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          final faq = faqs[index];
          return Card(
            color: backgroundColor,
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: accentColor, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ExpansionTile(
              collapsedIconColor: accentColor,
              iconColor: accentColor,
              title: Text(
                faq["question"]!,
                style: TextStyle(
                  color: accentColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text(
                    faq["answer"]!,
                    style: TextStyle(color: textColor),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
