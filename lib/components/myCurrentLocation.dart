import 'package:flutter/material.dart';

class Mycurrentlocation extends StatelessWidget {
  const Mycurrentlocation({super.key});

  void openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Your location"),
        content: const TextField(
            decoration: const InputDecoration(hintText: "Search address..")),
        actions: [
          //cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),

          //save button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Deliver now",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                //address
                Text(
                  "10, jalan 4/4",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),

                //drop down menu
                Icon(
                  Icons.keyboard_arrow_left_rounded,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
