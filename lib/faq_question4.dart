import 'package:flutter/material.dart';

class FaqQuestion4 extends StatelessWidget {
  const FaqQuestion4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFED4545), // Red color
        foregroundColor: Colors.white,
        title: const Text("FAQ"), // Title for the AppBar
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // Navigates back to the previous screen
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        // Added to handle overflow if content is long
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question title
            const Text(
              "How to register?",
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
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding:
                  const EdgeInsets.all(16.0), // More padding for readability
              child: const Text(
                "To register for an account, follow these steps:\n\n"
                "1. **Open the App:**\n"
                "   - Launch the app on your mobile device or visit the website on your computer.\n"
                "   - On the homepage, locate the 'Sign Up' or 'Register' button and tap or click on it.\n\n"
                "2. **Enter Your Details:**\n"
                "   - Fill in the required information, such as your full name, email address, and phone number.\n"
                "   - Create a strong password that you will remember. Some apps may require you to confirm the password by entering it again.\n\n"
                "3. **Submit and Start Using the App:**\n"
                "   - Tap or click on the 'Register' or 'Submit' button to complete the registration process.\n"
                "   - After submit your detail , you will back to the login page and input the Email and password that you have set just now.",
                style: TextStyle(
                    fontSize: 18,
                    height: 1.5), // Slightly smaller font for content
              ),
            ),
          ],
        ),
      ),
    );
  }
}
