import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neuc_cuisine/components/myCurrentLocation.dart';
import 'package:neuc_cuisine/components/myDescriptionBox.dart';
import 'package:neuc_cuisine/components/myDrawer.dart';
import 'package:neuc_cuisine/components/myFoodTile.dart';
import 'package:neuc_cuisine/components/mySilverAppbar.dart';
import 'package:neuc_cuisine/components/myTabBar.dart';
import 'package:neuc_cuisine/foodPage.dart';
import 'package:neuc_cuisine/models/food.dart';
import 'package:neuc_cuisine/models/restaurant.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  final String email;
  const Homepage({super.key, required this.email});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  //tab controller
  late TabController _tabController;
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);

    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  //sort out and return a list of food items that belong to a specific category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) {
      return food.category == category &&
          (food.name.toLowerCase().contains(_searchQuery) ||
              food.description.toLowerCase().contains(_searchQuery));
    }).toList();
  }

  //return list of foods in given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      //get category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final food = categoryMenu[index];

          //return food tile UI
          return Myfoodtile(
            food: food,
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Foodpage(food: food),
                )),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          Mysilverappbar(
            title: Mytabbar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "It's Finger-licking",
                        style: GoogleFonts.baloo2(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Good",
                        style: GoogleFonts.baloo2(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search",
                      fillColor: Colors.grey,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) => TabBarView(
            controller: _tabController,
            children: getFoodInThisCategory(restaurant.menu),
          ),
          // return Scaffold(
          //   drawer: const MyDrawer(),
          //   body: NestedScrollView(
          //     headerSliverBuilder: (context, innerBoxIsScrolled) => [
          //       Mysilverappbar(
          //           title: Mytabbar(tabController: _tabController),
          //           child: const Column(
          //             mainAxisAlignment: MainAxisAlignment.end,
          //             children: [
          //               Divider(indent: 25, endIndent: 25, color: Colors.white),

          //               //my current location
          //               // Mycurrentlocation(),

          //               //description box
          //               // Mydescriptionbox(),
          //             ],
          //           ))
          //     ],
          //     body: Consumer<Restaurant>(
          //       builder: (context, restaurant, child) => TabBarView(
          //         controller: _tabController,
          //         children: getFoodInThisCategory(restaurant.menu),
          //       ),
          // [
          //   ListView.builder(
          //       itemCount: 5,
          //       itemBuilder: (context, index) => Text("Pan Mee")),
          //   ListView.builder(
          //       itemCount: 5,
          //       itemBuilder: (context, index) => Text("MakMak")),
          //   ListView.builder(
          //       itemCount: 5,
          //       itemBuilder: (context, index) => Text("Beverages")),
          // ],
        ),
      ),
    );
  }
}
