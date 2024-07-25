import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neuc_cuisine/authPage.dart';
import 'package:neuc_cuisine/homePage.dart';

class Authone extends StatefulWidget {
  const Authone({super.key});

  @override
  State<Authone> createState() => _AuthoneState();
}

class _AuthoneState extends State<Authone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final email = snapshot.data?.email ?? '';
            return Homepage(email: email);
          } else {
            return Authpage();
          }
        },
      ),
    );
  }
}
