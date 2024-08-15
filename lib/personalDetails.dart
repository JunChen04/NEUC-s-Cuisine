import 'package:flutter/material.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => PersonalDetailsState();
}

class PersonalDetailsState extends State<PersonalDetails> {
  final TextEditingController textController = TextEditingController();
  void openEditBox({String? docID}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          //button to save
          ElevatedButton(
            onPressed: () {
              // // add a new note
              // if (docID == null) {
              //   firestoreService.addNote(textController.text);
              // }

              // //update an exsiting note
              // else {
              //   firestoreService.updateNote(docID, textController.text);
              // }

              // // clear the text controller
              // textController.clear();

              //close the box
              Navigator.pop(context);
            },
            child: Text("Save"),
          )
        ],
      ),
    );
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
            icon: Icon(Icons.arrow_back)),
        backgroundColor: Color(0xFFED4545),
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 65,
                    backgroundImage: NetworkImage(
                        "https://icons.veryicon.com/png/o/system/crm-android-app-icon/app-icon-person.png"),
                  ),
                  Positioned(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_a_photo),
                    ),
                    bottom: -10,
                    left: 80,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 300,
              width: 500,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 6), // changes position of shadow
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Username: ",
                          style: TextStyle(fontSize: 20),
                        ),
                        IconButton(
                          onPressed: openEditBox,
                          icon: Icon(Icons.settings),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Email: ",
                          style: TextStyle(fontSize: 20),
                        ),
                        IconButton(
                            onPressed: openEditBox, icon: Icon(Icons.settings))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Phone Number: ",
                          style: TextStyle(fontSize: 20),
                        ),
                        IconButton(
                            onPressed: openEditBox, icon: Icon(Icons.settings))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Address: ",
                          style: TextStyle(fontSize: 20),
                        ),
                        IconButton(
                            onPressed: openEditBox, icon: Icon(Icons.settings))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     SizedBox(
            //       width: 150,
            //       child: MaterialButton(
            //         onPressed: () {},
            //         color: Color(0xffFA4A0C), // Button color
            //         textColor: Colors.white, // Button text color
            //         padding: EdgeInsets.all(16.0), // Button padding
            //         shape: RoundedRectangleBorder(
            //           borderRadius:
            //               BorderRadius.circular(30.0), // Border radius here
            //         ),
            //         child: Text(
            //           'Save',
            //           style: TextStyle(fontSize: 18),
            //         ),
            //       ),
            //     ),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     SizedBox(
            //       width: 150,
            //       child: MaterialButton(
            //         onPressed: openEditBox,
            //         color: Color(0xffFA4A0C), // Button color
            //         textColor: Colors.white, // Button text color
            //         padding: EdgeInsets.all(16.0), // Button padding
            //         shape: RoundedRectangleBorder(
            //           borderRadius:
            //               BorderRadius.circular(30.0), // Border radius here
            //         ),
            //         child: Text(
            //           'Edit',
            //           style: TextStyle(fontSize: 18),
            //         ),
            //       ),
            //     )
            //   ],
            // )
            // Container(
            //   child: Column(
            //     children: [
            //       Row(
            //         children: [Text("Username: "), TextField()],
            //       ),
            //       Row(
            //         children: [Text("Email: "), TextField()],
            //       ),
            //       Row(
            //         children: [Text("Phone Number: "), TextField()],
            //       ),
            //       Row(
            //         children: [Text("Address: "), TextField()],
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
