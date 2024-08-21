import 'package:flutter/material.dart';

class FaqQuestion3 extends StatelessWidget {
  const FaqQuestion3({super.key});

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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question title
            const Text(
              "How to update profile?",
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
                "To make changes to your account, follow these steps:\n\n"
                " **Update Profile Information:**\n"
                "   - Go to Menu which allocate at top left corner and Select more. \n"
                "   - Select 'Change' and update your information such as name and phone.\n"
                "   - After making the necessary changes, click on 'Save' to update your profile.\n\n",
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
