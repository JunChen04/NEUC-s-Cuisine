import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                        fontSize: 54, color: Color(0xFFED4545)),
                  ),
                  SizedBox(
                    height: 5,
                  ),

                  //email
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          // border: OutlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.black)),
                          // enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.black)),
                          // focusedBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.black)),

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

                  SizedBox(
                    height: 10,
                  ),

                  //password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          // border: OutlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.black)),
                          // enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.black)),
                          // focusedBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.black)),
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

                  SizedBox(
                    height: 10,
                  ),

                  //confirm password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          // border: OutlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.black)),
                          // enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.black)),
                          // focusedBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.black)),
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

                  SizedBox(
                    height: 10,
                  ),

                  //enter phone number
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        obscureText: true,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          // border: OutlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.black)),
                          // enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.black)),
                          // focusedBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(color: Colors.black)),
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

                  SizedBox(
                    height: 15,
                  ),

                  //register button
                  ElevatedButton(
                      onPressed: () {
                        //register the acc
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFED4545),
                          foregroundColor: Colors.white,
                          textStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          minimumSize: Size(200, 60)),
                      child: Text('Register')),

                  SizedBox(
                    height: 10,
                  ),

                  //alr register
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already registered?',
                        style: TextStyle(color: Color(0xFFED4545)),
                      ),
                      TextButton(
                          onPressed: () {
                            //to login page
                          },
                          child: Text(
                            'Login now',
                            style: TextStyle(
                                color: Color(0xFFED4545),
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
