import 'package:flutter/material.dart';
import 'package:neuc_cuisine/cartPage.dart';
import 'package:neuc_cuisine/homePage.dart';
// Import your login page
import 'package:neuc_cuisine/login.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  // Function to sign out and navigate to login page
  // void _signOut() {
  //   Navigator.pushAndRemoveUntil(
  //     context,
  //     MaterialPageRoute(
  //         builder: (context) => LoginPage(
  //               showRegisterPage: () {},
  //             )),
  //     (Route<dynamic> route) => false,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
          'S E T T I N G',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Personal Details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    //profile page
                  },
                  child: Text(
                    'Change',
                    style: TextStyle(color: Color(0xFFED4545), fontSize: 15),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text('Image'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email'),
                      Text('Username'),
                      Text('Phone'),
                      Text('Address')
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cartpage(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cart',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cartpage(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Status',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cartpage(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'FAQ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cartpage(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sign Out',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Add some space between the text and the button
            // Container(
            //   padding: EdgeInsets.all(10),
            //   decoration: BoxDecoration(
            //       color: Colors.white, borderRadius: BorderRadius.circular(10)),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       const Text('Cart',
            //           style:
            //               TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            //       IconButton(
            //           onPressed: () {
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                 builder: (context) => Cartpage(),
            //               ),
            //             );
            //           },
            //           icon: Icon(Icons.arrow_forward_ios))
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Container(
            //   padding: EdgeInsets.all(10),
            //   decoration: BoxDecoration(
            //       color: Colors.white, borderRadius: BorderRadius.circular(10)),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text('Status',
            //           style:
            //               TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            //       IconButton(
            //           onPressed: () {
            //             //to status page
            //             // Navigator.push(
            //             //   context,
            //             //   MaterialPageRoute(
            //             //     builder: (context) => Cartpage(),
            //             //   ),
            //             // );
            //           },
            //           icon: Icon(Icons.arrow_forward_ios))
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Container(
            //   padding: EdgeInsets.all(10),
            //   decoration: BoxDecoration(
            //       color: Colors.white, borderRadius: BorderRadius.circular(10)),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text('FAQ',
            //           style:
            //               TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            //       IconButton(
            //           onPressed: () {
            //             // to FAQ page
            //             // Navigator.push(
            //             //   context,
            //             //   MaterialPageRoute(
            //             //     builder: (context) => Cartpage(),
            //             //   ),
            //             // );
            //           },
            //           icon: Icon(Icons.arrow_forward_ios))
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            // Container(
            //   padding: EdgeInsets.all(10),
            //   decoration: BoxDecoration(
            //       color: Colors.white, borderRadius: BorderRadius.circular(10)),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text('Sign Out',
            //           style:
            //               TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            //       IconButton(
            //           onPressed: () {
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                 builder: (context) => LoginPage(
            //                   showRegisterPage: () {},
            //                 ),
            //               ),
            //             );
            //           },
            //           icon: Icon(Icons.arrow_forward_ios))
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            // GestureDetector(
            //   onTap: () {},
            //   child: Container(
            //     padding: EdgeInsets.all(10),
            //     decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(10)),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Text('Sign Out',
            //             style: TextStyle(
            //                 fontWeight: FontWeight.bold, fontSize: 20)),
            //         Icon(Icons.arrow_forward_ios),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
