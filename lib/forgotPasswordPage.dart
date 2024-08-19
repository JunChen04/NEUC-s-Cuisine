import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  //reset password method
  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Password Reset'),
            content: Text('Password reset link sent! Check your email.'),
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
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error!'),
            content: Text(e.message.toString()),
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
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFED4545),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Enter Your Email, we will send a password reset link.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Color(0xFFED4545)),
            ),
          ),
          SizedBox(height: 10),

          //email textfield
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter email',
                  hintStyle: TextStyle(color: Colors.grey[300]),
                  labelText: 'Email Address',
                  labelStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.alternate_email_sharp),
                  prefixIconColor: Color(0xFFED4545),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),

          //reset password button
          MaterialButton(
            onPressed: passwordReset,
            child: Text(
              'Reset Password',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            color: Color(0xFFED4545),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
          ),
        ],
      ),
    );
  }
}
