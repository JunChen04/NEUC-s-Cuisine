import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neuc_cuisine/login.dart';
import 'package:neuc_cuisine/registerPage.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  // final _controller = PageController();

  // void initState() {
  //   super.initState();
  //   _controller.addListener(() {
  //     if (_controller.page == 1) {
  //       // User has swiped to the login page
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => Login()),
  //       );
  //     }
  //   });
  // }

//automatically to login
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => LoginPage(
                  showRegisterPage: () {},
                )),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFED4545),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'NCD, Food for NEUCians ',
              style: GoogleFonts.bungee(color: Colors.white, fontSize: 65),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Stack(
                children: [
                  Icon(
                    Icons.ramen_dining,
                    color: Colors.white,
                    size: 500,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
