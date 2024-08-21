import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neuc_cuisine/cartPage.dart';
import 'package:neuc_cuisine/faq.dart';
import 'package:neuc_cuisine/feedbackPage.dart';
import 'package:neuc_cuisine/getUserName.dart';
import 'package:neuc_cuisine/homePage.dart';
// Import your login page
import 'package:neuc_cuisine/login.dart';
import 'package:neuc_cuisine/models/restaurant.dart';
import 'package:neuc_cuisine/personalDetails.dart';
import 'package:neuc_cuisine/status.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neuc_cuisine/utils.dart';
import 'package:provider/provider.dart';

class MyProfile extends StatefulWidget {
  final String email;
  const MyProfile({super.key, required this.email});

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

  final user = FirebaseAuth.instance.currentUser!;
  final emailController = TextEditingController();

  Uint8List? _image;

  String? documentId;

  @override
  void initState() {
    super.initState();
    _fetchDocumentId();
  }

  Future<void> _fetchDocumentId() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('Email', isEqualTo: widget.email)
        .get();

    if (snapshot.docs.isNotEmpty) {
      setState(() {
        documentId = snapshot.docs.first.id;
      });
    }
  }

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      //cart
      final userCart = restaurant.cart;

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
            'M O R E',
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Personal Details',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {
                          //profile page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PersonalDetails(
                                email: widget.email,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'Change',
                          style:
                              TextStyle(color: Color(0xFFED4545), fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Container(
                          height: 150,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Stack(
                            children: [
                              _image != null
                                  ? CircleAvatar(
                                      radius: 65,
                                      backgroundImage: MemoryImage(_image!),
                                    )
                                  : CircleAvatar(
                                      radius: 65,
                                      backgroundImage: NetworkImage(
                                          "https://icons.veryicon.com/png/o/system/crm-android-app-icon/app-icon-person.png"),
                                    ),
                              Positioned(
                                child: IconButton(
                                  onPressed: selectImage,
                                  icon: Icon(Icons.add_a_photo),
                                ),
                                bottom: 20,
                                left: 60,
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            documentId != null
                                ? GetUserName(documentId: documentId!)
                                : Text('Loading...'),
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => Status(
                  //           cartItems: userCart,
                  //         ),
                  //       ),
                  //     );
                  //   },
                  //   child: Container(
                  //     padding: EdgeInsets.all(10),
                  //     decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.circular(10)),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Text(
                  //           'Status',
                  //           style: TextStyle(
                  //               fontWeight: FontWeight.bold, fontSize: 20),
                  //         ),
                  //         Icon(Icons.arrow_forward_ios)
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Faq(),
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
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
                          builder: (context) => FeedbackPage(
                            email: widget.email,
                          ),
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
                            'Feedback',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
