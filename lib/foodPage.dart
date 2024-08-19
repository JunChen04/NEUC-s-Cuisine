import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neuc_cuisine/models/food.dart';
import 'package:neuc_cuisine/models/restaurant.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addons, bool> selectedAddons = {};

  FoodPage({
    Key? key,
    required this.food,
  }) : super(key: key) {
    for (Addons addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  void addToCart(Food food, Map<Addons, bool> selectedAddons) {
    Navigator.pop(context);

    List<Addons> currentlySelectedAddons = [];
    for (Addons addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: Image.network(
                    widget.food.imagePath, // Ensure this is the URL
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.food.name,
                        style: GoogleFonts.allerta(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "RM ${widget.food.price.toStringAsFixed(2)}",
                        style: GoogleFonts.allerta(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.food.description,
                        style: GoogleFonts.allerta(
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Divider(color: Color(0xFFED4545)),
                      const SizedBox(height: 10),
                      Text("Add-ons",
                          style: GoogleFonts.allerta(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                      const SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFED4545)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: widget.food.availableAddons.length,
                          itemBuilder: (context, index) {
                            Addons addon = widget.food.availableAddons[index];
                            return CheckboxListTile(
                              title: Text(
                                addon.name,
                                style: GoogleFonts.allerta(),
                              ),
                              subtitle: Text(
                                'RM ${addon.price.toStringAsFixed(2)}',
                                style: GoogleFonts.allerta(color: Colors.grey),
                              ),
                              value: widget.selectedAddons[addon],
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.selectedAddons[addon] = value!;
                                });
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: ElevatedButton(
                    onPressed: () =>
                        addToCart(widget.food, widget.selectedAddons),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFED4545),
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: const Size(400, 60),
                    ),
                    child: const Text('Add to cart'),
                  ),
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
        ),

        //back button
        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
              margin: EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                // color: Colors.grey,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        )
      ],
    );
  }
}
