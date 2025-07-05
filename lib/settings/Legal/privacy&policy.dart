import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  final Color backgroundColor = const Color(0xFF030E2F);
  final Color accentColor = const Color(0xFF94e3a8);
  final Color textColor = Colors.white;

  final String policyText = '''
**Privacy Policy**

We respect your privacy and are committed to protecting your personal information.

**1. Information We Collect**
We may collect your name, email, phone number, and reservation details when you use our app.

**2. How We Use Your Information**
Your data is used to:
- Process and manage stadium reservations
- Communicate important updates
- Improve our services

**3. Data Sharing**
We do not share your data with third parties, except as required by law.

**4. Security**
Your data is securely stored and encrypted. We use industry-standard security practices.

**5. Your Choices**
You can update or delete your account at any time from the app settings.

**6. Updates to this Policy**
We may update this policy from time to time. Changes will be reflected in the app.

**7. Contact Us**
If you have any questions, contact us at: support@stadiumreserve.com
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text("Privacy & Policy", style: TextStyle(color: accentColor)),
        centerTitle: true,
        iconTheme: IconThemeData(color: accentColor),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            policyText,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              height: 1.6,
            ),
          ),
        ),
      ),
    );
  }
}
