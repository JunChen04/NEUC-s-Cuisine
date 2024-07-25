class Food {
  final String name;
  final String description;
  final String imagePath; //lib/img/panmee.jpg
  final double price;
  final FoodCategory category;
  List<Addons> availableAddons;

  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });
}

//food categories

enum FoodCategory { Noodles, Rice, Snack, Beverage }

//food addons
class Addons {
  String name;
  double price;

  Addons({
    required this.name,
    required this.price,
  });
}
