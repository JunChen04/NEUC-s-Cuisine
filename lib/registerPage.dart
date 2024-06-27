import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neuc_cuisine/login.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();

  void _register() {
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;
    final phone = _phoneController.text;

    if (email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        phone.isEmpty) {
      _showErrorDialog('All fields are required');
    } else if (password != confirmPassword) {
      _showErrorDialog('Passwords do not match');
    } else {
      // Registration successful, to login page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xFFED4545),
          title: Text(
            'Error',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
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
                ElevatedButton(
                  onPressed: _register,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFED4545),
                    foregroundColor: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    minimumSize: Size(200, 60),
                  ),
                  child: Text('Register'),
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
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text(
                        'Login now',
                        style: TextStyle(
                          color: Color(0xFFED4545),
                          fontWeight: FontWeight.bold,
                        ),
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
