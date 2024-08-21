import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neuc_cuisine/utils.dart';

class PersonalDetails extends StatefulWidget {
  final String email;
  const PersonalDetails({super.key, required this.email});

  @override
  State<PersonalDetails> createState() => PersonalDetailsState();
}

class PersonalDetailsState extends State<PersonalDetails> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  Uint8List? _image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  // Function to update user data
  Future<void> updateUserDetails() async {
    try {
      // Use the email passed from the previous page
      String email = widget.email;

      // Query the Firestore to get the document with the matching email
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('Email',
              isEqualTo: email) // Make sure the field name matches Firestore
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // Get the document reference
        DocumentReference userDoc = querySnapshot.docs.first.reference;

        // Create a map to hold the updated fields
        Map<String, dynamic> updatedData = {};

        // Check if name field is not empty and add to the update map
        if (nameController.text.isNotEmpty) {
          updatedData['Name'] = nameController.text.trim();
        }

        // Check if phone field is not empty and add to the update map
        if (phoneController.text.isNotEmpty) {
          updatedData['Phone'] = phoneController.text.trim();
        }

        // Only update Firestore if there is something to update
        if (updatedData.isNotEmpty) {
          await userDoc.update(updatedData);
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Details updated successfully!')),
        );

        // Go back to the previous screen after saving
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User not found.')),
        );
      }
    } catch (e) {
      print('Error updating details: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update details.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Details"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Color(0xFFED4545),
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepPurple),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: 'Name',
                            fillColor: Colors.grey[200],
                            filled: true,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextField(
                          controller: phoneController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepPurple),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: 'Phone',
                            fillColor: Colors.grey[200],
                            filled: true,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: MaterialButton(
                  onPressed: () async {
                    await updateUserDetails();
                  },
                  color: Color(0xFFED4545),
                  textColor: Colors.white,
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 5.0,
                  child: Text(
                    "Save",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
