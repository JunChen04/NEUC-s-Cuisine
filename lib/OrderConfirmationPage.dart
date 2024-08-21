import 'package:flutter/material.dart';
import 'package:neuc_cuisine/homePage.dart';

class OrderConfirmationPage extends StatelessWidget {
  const OrderConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Placed"),
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFFED4545),
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          children: [
            Icon(
              Icons.shopping_cart,
              size: 100.0, // Increase icon size
              color: Color(0xFFED4545), // Optional: Add color to match theme
            ),
            SizedBox(height: 20.0), // Add space between icon and text
            Text(
              "Your order has been placed successfully!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold, // Optional: Make the text bold
              ),
              textAlign: TextAlign.center, // Center text alignment
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Homepage(
                      email: '',
                    ),
                  ),
                );
              },
              color: Color(0xFFED4545), // Button color
              textColor: Colors.white, // Button text color
              padding: EdgeInsets.all(16.0), // Button padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0), // Border radius here
              ),
              child: Text(
                'Back to Home Page',
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
