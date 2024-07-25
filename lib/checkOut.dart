import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  int _value = 1;
  int _value2 = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "C H E C K O U T",
        ),
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFFED4545),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 16, 30, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Payment",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Payment Method",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blueAccent)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value!;
                          });
                        },
                      ),
                      Icon(Icons.credit_card),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Card",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  Divider(
                    color: Colors.grey[300],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 2,
                        groupValue: _value,
                        onChanged: (value) {
                          setState(() {
                            _value = value!;
                          });
                        },
                      ),
                      Icon(Icons.account_balance),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Bank Account",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Delivery Method", style: TextStyle(fontSize: 20)),
            SizedBox(
              height: 5,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blueAccent)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Radio(
                        value: 3,
                        groupValue: _value2,
                        onChanged: (value) {
                          setState(() {
                            _value2 = value!;
                          });
                        },
                      ),
                      Text(
                        "Table Delivery",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  Divider(
                    color: Colors.grey[300],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 4,
                        groupValue: _value2,
                        onChanged: (value) {
                          setState(() {
                            _value2 = value!;
                          });
                        },
                      ),
                      Text(
                        "Pick Up",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  "23,000",
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                width: 250.0, // Set the desired width here
                child: MaterialButton(
                  onPressed: () {},
                  color: Color(0xFFED4545), // Button color
                  textColor: Colors.white, // Button text color
                  padding: EdgeInsets.all(16.0), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30.0), // Border radius here
                  ),
                  child: Text(
                    'Proceed to Payment',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
