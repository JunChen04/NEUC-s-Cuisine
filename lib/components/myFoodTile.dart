import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neuc_cuisine/models/food.dart';

class Myfoodtile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const Myfoodtile({
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                //text food details
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
                        "RM " + food.price.toString(),
                        style: GoogleFonts.allerta(color: Color(0xFFED4545)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        food.description,
                        style: GoogleFonts.kanit(
                            color: const Color.fromARGB(255, 88, 88, 88)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                //food images
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    food.imagePath,
                    height: 120,
                    width: 100,
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: Color(0xFFED4545),
          endIndent: 25,
          indent: 25,
        )
      ],
    );
  }
}
