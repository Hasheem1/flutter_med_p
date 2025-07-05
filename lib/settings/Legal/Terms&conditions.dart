import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  final Color backgroundColor = const Color(0xFF030E2F);
  final Color accentColor = const Color(0xFF94e3a8);
  final Color textColor = Colors.white;

  final String termsText = '''
**Terms and Conditions**

By using our application, you agree to the following terms:

**1. Account Responsibility**
You are responsible for maintaining the confidentiality of your account and password.

**2. Reservation Policy**
All bookings are subject to availability. Cancellations must follow the stadium's rules.

**3. Prohibited Uses**
You may not use the app for any illegal or unauthorized purpose.

**4. Modifications to Service**
We reserve the right to modify or discontinue the app at any time without notice.

**5. Limitation of Liability**
We are not liable for any indirect or incidental damages arising from your use of the app.

**6. User Content**
Any content you submit remains your responsibility. Do not upload harmful or offensive material.

**7. Governing Law**
These terms are governed by local laws and regulations.

**8. Acceptance**
By continuing to use this app, you agree to these terms.

**9. Contact Us**
For questions, email: support@stadiumreserve.com
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text("Terms & Conditions", style: TextStyle(color: accentColor)),
        centerTitle: true,
        iconTheme: IconThemeData(color: accentColor),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            termsText,
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
