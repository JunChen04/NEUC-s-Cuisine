import 'package:flutter/material.dart';
import 'package:neuc_cuisine/cartItems.dart';
import 'package:neuc_cuisine/checkOut.dart';
import 'package:neuc_cuisine/components/myCartTile.dart';
import 'package:neuc_cuisine/models/restaurant.dart';
import 'package:neuc_cuisine/status.dart';
import 'package:provider/provider.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  double getTotalCartPrice(List<CartItem> cart) {
    return cart.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      //cart
      final userCart = restaurant.cart;

      if (userCart == null || userCart.isEmpty) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("C A R T"),
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFFED4545),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            actions: [
              // Clear cart button
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Your cart is already empty."),
                      actions: [
                        // Cancel button
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
          backgroundColor: Colors.grey[200],
          body: Center(
            child: Text(
              "Nothing is in here...",
              style: TextStyle(
                  color: Color(0xFFED4545), fontWeight: FontWeight.bold),
            ),
          ),
        );
      }

      final totalCartPrice = getTotalCartPrice(userCart);

      //scaffold UI
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("C A R T"),
          backgroundColor: Color(0xFFED4545),
          foregroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title:
                        const Text("Are you sure you want to clear your cart?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          restaurant.clearCart();
                        },
                        child: const Text("Yes"),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: userCart.length,
                itemBuilder: (context, index) {
                  //get individual cart item
                  final cartItem = userCart[index];

                  return Mycarttile(
                    cartItem: cartItem,
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // // Display total price
                  // Text(
                  //   'Total: \$${totalCartPrice.toStringAsFixed(2)}',
                  //   style: const TextStyle(
                  //     fontSize: 20,
                  //     fontWeight: FontWeight.bold,
                  //     color: Colors.black,
                  //   ),
                  // ),
                  // const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CheckOut(totalPrice: totalCartPrice),
                          // Status(cartItems: userCart),
                        ),
                      ); //to payment page
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFED4545),
                        foregroundColor: Colors.white,
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        minimumSize: Size(400, 60)),
                    child: Text('Checkout'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      );
    });
  }
}
