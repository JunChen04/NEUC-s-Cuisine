import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neuc_cuisine/models/food.dart';

class Myfoodtile extends StatelessWidget {
  final Food food;
  final VoidCallback? onTap;

  const Myfoodtile({
    Key? key,
    required this.food,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                // Food image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    food.imagePath,
                    height: 120,
                    width: 100,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(child: Text('Image not available'));
                    },
                  ),
                ),
                const SizedBox(width: 15),
                // Food details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        food.name,
                        style: GoogleFonts.allerta(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        "RM " + food.price.toStringAsFixed(2),
                        style: GoogleFonts.allerta(color: Color(0xFFED4545)),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        food.description,
                        style: GoogleFonts.kanit(
                            color: const Color.fromARGB(255, 88, 88, 88)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: Color(0xFFED4545),
            thickness: 1.5,
            height: 15,
            indent: 15,
            endIndent: 15,
          ),
        ],
      ),
    );
  }
}
