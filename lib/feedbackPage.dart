import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FeedbackPage extends StatefulWidget {
  final String email;
  FeedbackPage({super.key, required this.email});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _subjectController = TextEditingController();
  final _feedbackController = TextEditingController();
  late TextEditingController _emailController;

  Future sendEmail() async {
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    const serviceId = 'service_n1iwxyq';
    const templateId = 'template_z3y6v2j';
    const userId = 'mtHtlAmJ8x9_bC0uY';
    const privateKey = 'v1ei5AbZ3XVWTfu3GHd0M';

    try {
      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            "Authorization": "privateKey",
            'origin': 'http://localhost'
          },
          body: json.encode(
            {
              'service_id': serviceId,
              'template_id': templateId,
              'user_id': userId,
              'template_params': {
                'user_email': _emailController.text,
                'subject': _subjectController.text,
                'message': _feedbackController.text,
              }
            },
          ));

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        print("Email sent successfully!");
      } else {
        print("Failed to send email.");
      }

      return response.statusCode;
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: widget.email);
  }

  @override
  void dispose() {
    _subjectController.dispose();
    _feedbackController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _submitFeedback() async {
    if (_subjectController.text.isEmpty || _feedbackController.text.isEmpty) {
      _showErrorDialog('All fields are required.');
      return;
    } else {
      // sendEmail();
      final statusCode = await sendEmail();
      if (statusCode == 200) {
        _showSuccessDialog('Thank you for your feedback!');
        _subjectController.clear();
        _feedbackController.clear();
      } else {
        _showErrorDialog('Failed to send feedback. Please try again later.');
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFFED4545),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'F E E D B A C K',
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.feedback,
                  size: 100,
                  color: Color(0xFFED4545),
                ),
                SizedBox(height: 20),
                Text(
                  'Your Feedback',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 40,
                    color: Color(0xFFED4545),
                  ),
                ),
                SizedBox(height: 20),

                //email
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter email',
                        hintStyle: TextStyle(color: Colors.grey[300]),
                        labelText: 'Email Address',
                        labelStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.alternate_email_sharp),
                        prefixIconColor: Color(0xFFED4545),
                      ),
                      readOnly: true, // Make the email field read-only
                    ),
                  ),
                ),
                SizedBox(height: 20),

                //subject textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      controller: _subjectController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Subject',
                        hintStyle: TextStyle(color: Colors.grey[300]),
                        labelText: 'Subject',
                        labelStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.subtitles_rounded),
                        prefixIconColor: Color(0xFFED4545),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                //feedback textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      controller: _feedbackController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Feedback',
                        hintStyle: TextStyle(color: Colors.grey[300]),
                        labelText: 'Feedback',
                        labelStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.feedback_outlined),
                        prefixIconColor: Color(0xFFED4545),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitFeedback,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFED4545),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
