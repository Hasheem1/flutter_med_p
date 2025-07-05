import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class JoinUsScreen extends StatefulWidget {
  @override
  _JoinUsScreenState createState() => _JoinUsScreenState();
}

class _JoinUsScreenState extends State<JoinUsScreen> {
  final Color backgroundColor = const Color(0xFF030E2F);
  final Color accentColor = const Color(0xFF94e3a8);
  final Color textColor = Colors.white;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String? userEmail = FirebaseAuth.instance.currentUser?.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text("Join Us", style: TextStyle(color: accentColor)),
        centerTitle: true,
        iconTheme: IconThemeData(color: accentColor),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                "Become part of our team or community. Fill out the form below and we'll get in touch!",
                style: TextStyle(color: textColor, fontSize: 16, height: 1.6),
              ),
              SizedBox(height: 20),
              _buildTextField("Full Name", nameController,),
              SizedBox(height: 12),
              _buildTextField("Email", emailController, isEmail: true),
              SizedBox(height: 12),
              _buildTextField("Message", messageController, maxLines: 4),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: addReservation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: accentColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text("Send", style: TextStyle(color: backgroundColor, fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool isEmail = false, int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      style: TextStyle(color: textColor),
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      validator: (value) {
        if (value == null || value.isEmpty) return 'Please enter $label';
        if (isEmail && !RegExp(r'\S+@\S+\.\S+').hasMatch(value)) return 'Enter a valid email';
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: accentColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: accentColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: accentColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

  }
  Future<void> addReservation() async {
    if (nameController == null || emailController == null || messageController == null) return;



    Map<String, dynamic> joinUsMessage = {
      'Full name':nameController.text,
      'Email':emailController.text,
      'Message ':messageController.text,
      'cuurent user email':userEmail,
      'message time':DateTime.now()
    };
 
    try {

      final reservationCollection = firestore
        .collection('userCollection')
          .doc(userEmail)
          .collection('join us message');

      final snapshot = await reservationCollection.get();
      int reservationCountMessage = snapshot.docs.length;

      String newDocName = 'join us message${reservationCountMessage + 1}';
      await reservationCollection.doc(newDocName).set(joinUsMessage);
      print('Reservation added as $newDocName');
      _submitForm();
    } catch (error) {
      print('Failed to add reservation: $error');
    }
  }
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Thank you for reaching out!", style: TextStyle(color: textColor))),
      );
      nameController.clear();
      emailController.clear();
      messageController.clear();
    }
  }

}
