import 'package:flutter/material.dart';

class Mydescriptionbox extends StatelessWidget {
  const Mydescriptionbox({super.key});

  @override
  Widget build(BuildContext context) {
    //textstyle
    // var myPrimaryTextStyle =
    //     TextStyle(color: Theme.of(context).colorScheme.inversePrimary);
    // var mySecondaryTextStyle =
    //     TextStyle(color: Theme.of(context).colorScheme.primary);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(8),
        color: Color.fromARGB(255, 253, 253, 253),
      ),
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //delivery fee
          Column(
            children: [
              Text(
                "RM 10",
                // style: myPrimaryTextStyle,
                style: TextStyle(color: Color(0xFFED4545)),
              ),
              Text(
                "Delivery fee",
                // style: mySecondaryTextStyle,
                style: TextStyle(
                    color: Color(0xFFED4545), fontWeight: FontWeight.bold),
              ),
            ],
          ),
          //delivery time
          Column(
            children: [
              Text(
                "15-30 min",
                // style: myPrimaryTextStyle,
                style: TextStyle(color: Color(0xFFED4545)),
              ),
              Text(
                "Delivery time",
                // style: mySecondaryTextStyle,
                style: TextStyle(
                    color: Color(0xFFED4545), fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
