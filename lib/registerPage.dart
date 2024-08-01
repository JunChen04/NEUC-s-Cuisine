import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neuc_cuisine/login.dart';

class Registerpage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const Registerpage({super.key, required this.showLoginPage});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();

  void registerUser() async {
    // Show loading circle
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   },
    // );

    if (_emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty ||
        _phoneController.text.isEmpty) {
      _showErrorDialog('All fields are required');
      return;
    } else if (_passwordController.text != _confirmPasswordController.text) {
      _showErrorDialog('Passwords do not match');
      return;
    } else {
      // Try sign in
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        // If successful, pop the loading dialog
        // Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(
              showRegisterPage: () {},
            ),
          ),
        );
      } on FirebaseAuthException catch (e) {
        // Pop the loading circle
        // Navigator.pop(context);

        // Show error message
        if (e.code == 'weak-password') {
          weakPasswordMessage();
        } else if (e.code == 'email-already-in-use') {
          wrongEmailMessage();
        } else {
          generalErrorMessage(e.message);
        }
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error!'),
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

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Invalid Email'),
          content: Text('Email in use.'),
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

  void weakPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Weak Password'),
          content: Text('Weak password provided for the user.'),
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

  void generalErrorMessage(String? message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error!'),
          content:
              Text(message ?? 'An unknown error occurred. Please try again.'),
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
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  // Future signUp() async {
  //   if (passwordConfirmed()) {
  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //         email: _emailController.text.trim(),
  //         password: _passwordController.text.trim());
  //   }
  // }

  // bool passwordConfirmed() {
  //   if (_passwordController.text.trim() ==
  //       _confirmPasswordController.text.trim()) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.ramen_dining,
                  size: 100,
                  color: Color(0xFFED4545),
                ),
                Text(
                  'R E G I S T E R',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 54,
                    color: Color(0xFFED4545),
                  ),
                ),
                SizedBox(height: 5),
                // Email
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
                // Password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        hintText: 'Enter password',
                        hintStyle: TextStyle(color: Colors.grey[300]),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.password),
                        prefixIconColor: Color(0xFFED4545),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Confirm Password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        hintText: 'Enter password again',
                        hintStyle: TextStyle(color: Colors.grey[300]),
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.password),
                        prefixIconColor: Color(0xFFED4545),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Phone Number
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: 'Enter phone number',
                        hintStyle: TextStyle(color: Colors.grey[300]),
                        labelText: 'Phone',
                        labelStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.phone),
                        prefixIconColor: Color(0xFFED4545),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),

                // Register Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: registerUser,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color(0xFFED4545),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                // Already Registered
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already registered?',
                      style: TextStyle(color: Color(0xFFED4545)),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to Register page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPage(
                                    showRegisterPage: () {},
                                  )),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            ' Login now',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFED4545)),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
