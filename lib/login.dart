import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(
              child: Text(
                'Login',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40),
              ),
            ),
            Center(
              child: Container(
                width: 140,
                height: 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffED4545),
                ),
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Email address',
              style: TextStyle(fontSize: 17),
            ),
            TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Enter Your Email',
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Password',
              style: TextStyle(fontSize: 17),
            ),
            TextField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Enter your password',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Forgot Passcode',
              style: TextStyle(color: Color(0xffED4545)),
            ),
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => const SignUpPage()),
            //     );
            //   },
            //   child: const Text(
            //     "Don't have an account yet? Sign up right now !",
            //     style: TextStyle(
            //       color: Colors.blue,
            //       decoration: TextDecoration.underline,
            //     ),
            //   ),
            // )
            Row(
              children: [
                Text(
                  "Don't have an account yet?",
                  style: TextStyle(color: Color(0xffED4545)),
                ),
                TextButton(
                    onPressed: () {
                      // Handle login logic here
                    },
                    child: Text(
                      "Sign up right now !",
                      style: TextStyle(color: Color(0xffED4545)),
                    ))
              ],
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Center(
                child: SizedBox(
                  width: 200,
                  height: 60,
                  child: MaterialButton(
                    color: Color(0xffED4545),
                    textColor: Colors.white,
                    onPressed: () {
                      // Handle login logic here
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 18),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            30) // Change border radius here
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
