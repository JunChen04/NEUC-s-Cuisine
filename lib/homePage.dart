import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //sort out and return a list of food items that belong to a specific category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
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
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          Mysilverappbar(
              title: Mytabbar(tabController: _tabController),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Divider(indent: 25, endIndent: 25, color: Colors.white),

                  //my current location
                  Mycurrentlocation(),

                  //description box
                  Mydescriptionbox(),
                ],
              ))
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) => TabBarView(
            controller: _tabController,
            children: getFoodInThisCategory(restaurant.menu),
          ),
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
