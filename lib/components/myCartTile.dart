// import 'package:flutter/material.dart';
// import 'package:neuc_cuisine/cartItems.dart';
// import 'package:neuc_cuisine/components/myQuantitySelector.dart';
// import 'package:neuc_cuisine/models/restaurant.dart';
// import 'package:provider/provider.dart';

// class Mycarttile extends StatelessWidget {
//   final CartItem cartItem;

//   const Mycarttile({
//     super.key,
//     required this.cartItem,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<Restaurant>(
//       builder: (context, restaurant, child) {
//         // if (cartItem == null) {
//         //   return SizedBox
//         //       .shrink(); // Return an empty widget if cartItem is null
//         // }

//         final food = cartItem.food;
//         // if (food == null) {
//         //   return SizedBox.shrink(); // Return an empty widget if food is null
//         // }

//         return Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(8),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5), // Add a shadow for depth
//                 spreadRadius: 1,
//                 blurRadius: 4,
//                 offset: Offset(0, 2), // changes the position of the shadow
//               ),
//             ],
//           ),
//           margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     // Food image
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(8),
//                       child: Image.asset(
//                         food.imagePath,
//                         height: 100,
//                         width: 100,
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     // Name and price
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Food name
//                         Text(
//                           food.name,
//                           style: TextStyle(
//                               fontWeight:
//                                   FontWeight.bold), /*food.name ?? 'Unknown' */
//                         ),
//                         // Food price
//                         Text(
//                           // "RM ${food.price?.toString() ?? '0'}"
//                           "RM ${food.price.toString()}",
//                           style: TextStyle(fontWeight: FontWeight.w300),
//                         ),
//                       ],
//                     ),
//                     const Spacer(),
//                     // Increment or decrement quantity
//                     Myquantityselector(
//                       quantity: cartItem.quantity,
//                       // cartItem.quantity ?? 1,// Ensure quantity is not null
//                       food: food,
//                       onDecrement: () {
//                         restaurant.removeFromCart(cartItem);
//                       },
//                       onIncrement: () {
//                         restaurant.addToCart(
//                             cartItem.food, cartItem.selectedAddons);
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 10),
//               // Addons
//               if (cartItem.selectedAddons.isNotEmpty)
//                 SizedBox(
//                   height: 50,
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     padding:
//                         const EdgeInsets.only(left: 10, bottom: 10, right: 10),
//                     children: cartItem.selectedAddons
//                         .map(
//                           (addon) => Padding(
//                             padding: const EdgeInsets.only(right: 8.0),
//                             child: FilterChip(
//                               label: Row(
//                                 children: [
//                                   // Addon name
//                                   Text(addon.name),
//                                   // ??'Unknown'), // Ensure addon name is not null
//                                   // Addon price
//                                   Text(
//                                       // '(RM${addon.price?.toString() ?? '0'})'
//                                       '(RM${addon.price.toString()})'), // Ensure addon price is not null
//                                 ],
//                               ),
//                               shape: const StadiumBorder(
//                                   side: BorderSide(color: Colors.black)),
//                               onSelected: (value) {},
//                               backgroundColor: Colors.white,
//                               labelStyle: const TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 12,
//                               ),
//                             ),
//                           ),
//                         )
//                         .toList(),
//                   ),
//                 ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:neuc_cuisine/cartItems.dart';
import 'package:neuc_cuisine/components/myQuantitySelector.dart';
import 'package:neuc_cuisine/models/restaurant.dart';
import 'package:provider/provider.dart';

class Mycarttile extends StatelessWidget {
  final CartItem cartItem;

  const Mycarttile({
    Key? key,
    required this.cartItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        final food = cartItem.food;

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    // Food image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        food.imagePath, // Ensure this URL is correct and accessible
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                            child: Icon(Icons.error, color: Colors.red),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Name and price
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Food name
                          Text(
                            food.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Food price
                          Text(
                            "RM ${food.price.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Increment or decrement quantity
                    Myquantityselector(
                      quantity: cartItem.quantity,
                      food: food,
                      onDecrement: () {
                        restaurant.removeFromCart(cartItem);
                      },
                      onIncrement: () {
                        restaurant.addToCart(
                          cartItem.food,
                          cartItem.selectedAddons,
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Addons
              if (cartItem.selectedAddons.isNotEmpty)
                SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding:
                        const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                    children: cartItem.selectedAddons
                        .map(
                          (addon) => Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: FilterChip(
                              label: Row(
                                children: [
                                  // Addon name
                                  Text(addon.name),
                                  // Addon price
                                  Text(
                                    '(RM ${addon.price.toStringAsFixed(2)})',
                                  ),
                                ],
                              ),
                              shape: const StadiumBorder(
                                side: BorderSide(color: Colors.black),
                              ),
                              onSelected: (bool value) {},
                              backgroundColor: Colors.white,
                              labelStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
