import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neuc_cuisine/components/myDrawer.dart';
import 'package:neuc_cuisine/components/mySilverAppbar.dart';
import 'package:neuc_cuisine/components/myTabBar.dart';
import 'package:neuc_cuisine/models/food.dart'; // For FoodCategory and Food model
import 'package:neuc_cuisine/models/food_list.dart'; // For FoodList widget

class Homepage extends StatefulWidget {
  final String email;
  const Homepage({super.key, required this.email});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  // Tab controller
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: MyDrawer(
          email: widget.email,
          showLoginPage: () {},
        ),
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
          body: TabBarView(
            controller: _tabController,
            children: FoodCategory.values.map((category) {
              return FoodList(
                category: category,
                searchQuery: _searchQuery,
              );
            }).toList(),
          ),
        ));
  }
}
