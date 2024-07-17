import 'package:flutter/material.dart';
import 'package:neuc_cuisine/models/food.dart';
import 'package:neuc_cuisine/models/restaurant.dart';
import 'package:provider/provider.dart';

class Foodpage extends StatefulWidget {
  final Food food;
  final Map<Addons, bool> selectedAddons = {};

  Foodpage({
    super.key,
    required this.food,
  }) {
//initialize selected addons to be false
    for (Addons addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<Foodpage> createState() => _FoodpageState();
}

class _FoodpageState extends State<Foodpage> {
  //method to add cart
  void addToCart(Food food, Map<Addons, bool> selectedAddons) {
    //close current food page to back to menu
    Navigator.pop(context);

    //format selected addons
    List<Addons> currentlySelectedAddons = [];
    for (Addons addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    //add to cart
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                //food image
                SizedBox(
                  width: double.infinity,
                  height: 300, // Set the desired height
                  child: Image.asset(
                    widget.food.imagePath,
                    fit: BoxFit.cover, // Ensure the image covers the box
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //food name
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),

                      //food price
                      Text(
                        "RM " + widget.food.price.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      //food descriptions
                      Text(
                        widget.food.description,
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      Divider(
                        color: Color(0xFFED4545),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      //addons
                      Text(
                        "Add-ons",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFFED4545),
                            ),
                            borderRadius: BorderRadius.circular(8)),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: widget.food.availableAddons.length,
                          itemBuilder: (context, index) {
                            //get individual addon
                            Addons addon = widget.food.availableAddons[index];

                            //return checkbox UI
                            return CheckboxListTile(
                              title: Text(addon.name),
                              subtitle: Text(
                                'RM ' + addon.price.toString(),
                                style: TextStyle(color: Colors.grey),
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
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                //button add to cart
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: ElevatedButton(
                    onPressed: () =>
                        addToCart(widget.food, widget.selectedAddons),
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
                    child: Text('Add to cart'),
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),
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
