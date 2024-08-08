import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neuc_cuisine/components/myDrawTile.dart';
import 'package:neuc_cuisine/login.dart';
import 'package:neuc_cuisine/profile.dart';

// import 'package:neuc_cuisine/settingsPage.dart';

class MyDrawer extends StatelessWidget {
  final String email;
  final VoidCallback showLoginPage;
  MyDrawer({super.key, required this.email, required this.showLoginPage});

  // final user = FirebaseAuth.instance.currentUser;

  //sign user out
  // void signUserOut(BuildContext context) {
  //   FirebaseAuth.instance.signOut();
  // }
  // Future<void> signOut() async {
  //   return await FirebaseAuth.instance.signOut();
  //   Navigator.pop(context);
  // }
  void signUserOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(
            showRegisterPage: () {},
          ),
        ),
      );
    } catch (e) {
      print('Error signing out: ${e.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error signing out. Please try again.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          //app logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.ramen_dining,
              size: 80,
              color: Color(0xFFED4545),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Color(0xFFED4545),
            ),
          ),

          //home list tile
          MyDrawTile(
            text: "H O M E",
            icon: Icons.home,
            onTap: () {
              Navigator.pop(context);
            },
          ),

          //settings list tile
          MyDrawTile(
            text: "S E T T I N G S",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyProfile(
                    email: email,
                  ),
                ),
              );
            },
          ),

          const Spacer(),

          //logout list tile
          MyDrawTile(
            text: "L O G O U T",
            icon: Icons.logout,
            onTap: () => signUserOut(context),
          ),

          SizedBox(height: 25),
        ],
      ),
    );
  }
}
