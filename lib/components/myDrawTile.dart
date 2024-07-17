import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawTile extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? onTap;

  const MyDrawTile({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(
            color: Color(0xFFED4545),
          ),
        ),
        leading: Icon(
          icon,
          color: Color(0xFFED4545),
        ),
        onTap: onTap, // Add this line
      ),
    );
  }
}
