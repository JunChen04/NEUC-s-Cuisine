import 'package:flutter/material.dart';
import 'package:neuc_cuisine/OrderConfirmationPage.dart';
import 'package:neuc_cuisine/models/restaurant.dart';
import 'package:neuc_cuisine/paymentButton.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatefulWidget {
  final double totalPrice;

  CheckOut({super.key, required this.totalPrice});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  int _value = 1;
  int _value2 = 3;

  @override
  Widget build(BuildContext context) {
    final restaurant = Provider.of<Restaurant>(context, listen: false);
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
                      Icon(Icons.money),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Cash",
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
                        "Online Transfer",
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
                  "Total :",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "\RM${widget.totalPrice.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
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
                  onPressed: () {
                    if (_value == 1) {
                      // Cash selected, clear the cart and navigate to order confirmation page
                      final restaurant =
                          Provider.of<Restaurant>(context, listen: false);
                      restaurant.clearCart();
                      // Cash selected, navigate to order confirmation page
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Reminder"),
                            content: Text("Please pay at the counter."),
                            actions: <Widget>[
                              TextButton(
                                child: Text("OK"),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                  // Navigate to OrderConfirmationPage
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          OrderConfirmationPage(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else if (_value == 2) {
                      // Online Transfer selected, proceed to payment page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => payment(
                            totalPrice: widget.totalPrice,
                            cartItems: restaurant.cart,
                          ),
                        ),
                      );
                    }
                  },
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
