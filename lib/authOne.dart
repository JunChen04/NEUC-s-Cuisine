import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neuc_cuisine/authPage.dart';
import 'package:neuc_cuisine/homePage.dart';
import 'package:neuc_cuisine/login.dart';

class Authone extends StatefulWidget {
  const Authone({super.key});

  @override
  State<Authone> createState() => _AuthoneState();
}

class _AuthoneState extends State<Authone> {
  @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             final email = snapshot.data?.email ?? '';
//             return Homepage(email: email);
//           } else {
//             // return Authpage();
//             return LoginPage(showRegisterPage: () {});
//           }
//         },
//       ),FirebaseAuth.instance.authStateChanges().listen((User? user) {
//   if (user == null) {
//     // User is signed out
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (context) => LoginPage(
//           showRegisterPage: () {},
//         ),
//       ),
//     );
//   }
// });

//     );
//   }
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        // User is signed out
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(
              showRegisterPage: () {},
            ),
          ),
        );
      } else {
        // User is signed in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Homepage(email: user.email ?? ''),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child:
              CircularProgressIndicator()), // Show loading indicator while checking auth state
    );
  }
}
