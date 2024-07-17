import 'package:flutter/material.dart';
import 'package:neuc_cuisine/cartPage.dart';

class Mysilverappbar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const Mysilverappbar({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        //cart button
        IconButton(
          onPressed: () {
            //go to cart page
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Cartpage(),
              ),
            );
          },
          icon: const Icon(Icons.shopping_cart),
          // color: Colors.white,
        )
      ],
      backgroundColor: Color(0xFFED4545),
      foregroundColor: Colors.white,
      title: const Text(
        "NEUC CUISINE",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: child,
        ),
        title: title,
        centerTitle: true,
        expandedTitleScale: 1,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
      ),
    );
  }
}
