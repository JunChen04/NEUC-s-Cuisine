import 'package:flutter/material.dart';

class Status extends StatelessWidget {
  const Status({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("S T A T U S"),
        backgroundColor: Color(0xFFED4545),
        foregroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Text(
            //       "Cart",
            //       style: TextStyle(fontSize: 20),
            //     ),
            //     // Add a Container with a BoxDecoration to draw a line under the text "Status"
            //     Container(
            //       width: 100,
            //       padding: EdgeInsets.only(
            //           bottom: 8.0), // Padding to adjust vertical position
            //       child: Text(
            //         "Status",
            //         textAlign:
            //             TextAlign.center, // Center align the text horizontally
            //         style: TextStyle(fontSize: 20),
            //       ),
            //       decoration: BoxDecoration(
            //         border: Border(
            //           bottom: BorderSide(width: 3.0, color: Color(0xffFA4A0C)),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('name'),
                      Column(
                        children: [Text("Name"), Text("Price")],
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "Pending",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('name'),
                      Column(
                        children: [Text("Name"), Text("Price")],
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "Pending",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('name'),
                      Column(
                        children: [Text("Name"), Text("Price")],
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "Pending",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('name'),
                      Column(
                        children: [Text("Name"), Text("Price")],
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "Pending",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
