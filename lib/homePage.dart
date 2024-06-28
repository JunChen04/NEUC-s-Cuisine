import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final String email;
  const Homepage({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('email: $email'),
      ),
    );
  }
}
