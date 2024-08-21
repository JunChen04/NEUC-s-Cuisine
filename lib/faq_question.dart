import 'package:flutter/material.dart';

class FaqQuestion extends StatelessWidget {
  const FaqQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FAQ"), // Title for the AppBar
        backgroundColor: const Color(0xFFED4545), // Red color
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // Navigates back to the previous screen
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question title
            const Text(
              "How to order?",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold, // Added bold for emphasis
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Container for the FAQ content
            Container(
              width: double.infinity, // Fills the width of its parent
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              padding:
                  const EdgeInsets.all(16.0), // More padding for readability
              child: const Text(
                "To place an order, follow these steps:\n\n"
                "1. Browse through our menu and select the items you'd like to order.\n"
                "2. Once you've selected your items, click on the cart icon in the top right corner to review your order.\n"
                "3. If everything looks good, click on the 'Checkout' button.\n"
                "4. Enter your delivery details and choose your preferred payment method.\n"
                "5. Finally, confirm your order by clicking on the 'Proceed to Payment' button.\n\n",
                style: TextStyle(
                    fontSize: 18,
                    height: 1.5), // Slightly smaller font for content
              ),
            ),
            const SizedBox(height: 20), // Space between questions
            // Additional FAQ section
          ],
        ),
      ),
    );
  }
}
