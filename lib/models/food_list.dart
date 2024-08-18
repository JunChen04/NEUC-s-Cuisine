// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:neuc_cuisine/components/myFoodTile.dart';
// import 'package:neuc_cuisine/foodPage.dart';
// import 'package:neuc_cuisine/models/food.dart';

// class FoodList extends StatelessWidget {
//   final FoodCategory category;

//   FoodList({required this.category});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance
//           .collection('menu')
//           .where('category', isEqualTo: category.toString().split('.').last)
//           .snapshots(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }
//         if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         }
//         if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//           return Center(child: Text('No food items found.'));
//         }

//         final foodDocs = snapshot.data!.docs;

//         return ListView.builder(
//           itemCount: foodDocs.length,
//           itemBuilder: (context, index) {
//             final foodDoc = foodDocs[index].data() as Map<String, dynamic>;

//             // Handle availableAddons as a map if it's not a list
//             final availableAddons =
//                 (foodDoc['availableAddons'] as Map<String, dynamic>?)
//                         ?.values
//                         .map((addon) => Addons(
//                               name: (addon as Map<String, dynamic>)['name'] ??
//                                   'No name',
//                               price: ((addon as Map<String, dynamic>)['price']
//                                           as num?)
//                                       ?.toDouble() ??
//                                   0.0,
//                             ))
//                         .toList() ??
//                     [];

//             final food = Food(
//               name: foodDoc['name'] ?? 'No name',
//               description: foodDoc['description'] ?? 'No description',
//               imagePath: foodDoc['imagePath'] ?? '',
//               price: (foodDoc['price'] as num?)?.toDouble() ?? 0.0,
//               category: FoodCategory.values.firstWhere(
//                 (e) => e.toString() == 'FoodCategory.${foodDoc['category']}',
//                 orElse: () => FoodCategory.Noodles, // Default value
//               ),
//               availableAddons: availableAddons,
//             );
//             return Myfoodtile(
//               food: food,
//               onTap: () {
//                 // Handle tap event here
//                 print('Tapped on ${food.name}');
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => FoodPage(food: food),
//                   ),
//                 );
//               },
//             );
//           },
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:neuc_cuisine/components/myFoodTile.dart';
import 'package:neuc_cuisine/foodPage.dart';
import 'package:neuc_cuisine/models/food.dart';

class FoodList extends StatelessWidget {
  final FoodCategory category;
  final String searchQuery; // Add search query as a parameter

  FoodList({required this.category, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('menu')
          .where('category', isEqualTo: category.toString().split('.').last)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No food items found.'));
        }

        final foodDocs = snapshot.data!.docs;

        // Filter the results by the search query
        final filteredDocs = foodDocs.where((doc) {
          final foodData = doc.data() as Map<String, dynamic>;
          final foodName = (foodData['name'] ?? '').toString().toLowerCase();
          return foodName.contains(searchQuery.toLowerCase());
        }).toList();

        if (filteredDocs.isEmpty) {
          return Center(child: Text('No food items match your search.'));
        }

        return ListView.builder(
          itemCount: filteredDocs.length,
          itemBuilder: (context, index) {
            final foodDoc = filteredDocs[index].data() as Map<String, dynamic>;

            // Handle availableAddons as a map if it's not a list
            final availableAddons =
                (foodDoc['availableAddons'] as Map<String, dynamic>?)
                        ?.values
                        .map((addon) => Addons(
                              name: (addon as Map<String, dynamic>)['name'] ??
                                  'No name',
                              price: ((addon as Map<String, dynamic>)['price']
                                          as num?)
                                      ?.toDouble() ??
                                  0.0,
                            ))
                        .toList() ??
                    [];

            final food = Food(
              name: foodDoc['name'] ?? 'No name',
              description: foodDoc['description'] ?? 'No description',
              imagePath: foodDoc['imagePath'] ?? '',
              price: (foodDoc['price'] as num?)?.toDouble() ?? 0.0,
              category: FoodCategory.values.firstWhere(
                (e) => e.toString() == 'FoodCategory.${foodDoc['category']}',
                orElse: () => FoodCategory.Noodles, // Default value
              ),
              availableAddons: availableAddons,
            );

            return Myfoodtile(
              food: food,
              onTap: () {
                // Handle tap event here
                print('Tapped on ${food.name}');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodPage(food: food),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
