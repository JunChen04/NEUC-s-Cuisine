import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:neuc_cuisine/models/food.dart';

class Mytabbar extends StatelessWidget {
  final TabController tabController;

  const Mytabbar({
    super.key,
    required this.tabController,
  });

  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final selectedColor =
        Color(0xFFED4545); // Change this to your desired color
    final unselectedColor = Colors.grey;

    return Container(
      child: TabBar(
        controller: tabController,
        labelColor: selectedColor,
        unselectedLabelColor: unselectedColor,
        indicatorColor: selectedColor,
        tabs: _buildCategoryTabs(),
      ),
    );
  }
}
