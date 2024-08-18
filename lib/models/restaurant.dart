import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:neuc_cuisine/cartItems.dart';
import 'package:neuc_cuisine/models/food.dart';

class Restaurant extends ChangeNotifier {
  // List of menu
  // final List<Food> _menu = [
  //   // Panmee
  //   Food(
  //       name: "Pan Mee",
  //       description:
  //           "Traditional Pan Mee which is also the noodles that you can eat in NEUC",
  //       imagePath:
  //           // "C:/Users/Cheong Wei San/Desktop/FirstApp/first_app/lib/images/panmee.jpg"
  //           "Assets/Images/panmee.jpg",
  //       // "C:/Users/Cheong Wei San/Desktop/NEUC_CUISINE/lib/images/chillipanmee.jpg",
  //       price: 7.50,
  //       category: FoodCategory.Noodles,
  //       availableAddons: [
  //         Addons(name: "Dry", price: 0.00),
  //         Addons(name: "Add on noodles", price: 8.50),
  //       ]),
  //   Food(
  //       name: "Chilli's Pan Mee",
  //       description:
  //           "Traditional spicy Pan Mee with a lot of chili, once a wise man said: If you can't eat spicy then you are not Malaysian",
  //       imagePath:
  //           // "C:/Users/Cheong Wei San/Desktop/FirstApp/first_app/lib/images/chillipanmee.jpg"
  //           "Assets/Images/chillipanmee.jpg",
  //       price: 9.00,
  //       category: FoodCategory.Noodles,
  //       availableAddons: [
  //         Addons(name: "Extra spicy", price: 0.00),
  //         Addons(name: "Add on noodles", price: 1.00),
  //       ]),
  //   Food(
  //       name: "Kuew Teow Soup",
  //       description: "Kuey Teow Soup, nothing special, but no choice",
  //       imagePath:
  //           // "C:/Users/Cheong Wei San/Desktop/FirstApp/first_app/lib/images/chillipanmee.jpg"
  //           "Assets/Images/kueyteow.jpg",
  //       price: 9.00,
  //       category: FoodCategory.Noodles,
  //       availableAddons: [
  //         Addons(name: "Extra spicy", price: 0.00),
  //         Addons(name: "Add on noodles", price: 1.00),
  //       ]),

  //   // Beverages

  //   // Makmak
  //   Food(
  //       name: "Mee Goreng",
  //       description:
  //           "Fried noodles with a lot of spices which might make someone diarrhea, but it's considered cheap in NEUC, so who cares?",
  //       imagePath: "Assets/Images/meegoreng.jpg",
  //       price: 6.00,
  //       category: FoodCategory.Noodles,
  //       availableAddons: [
  //         Addons(name: "Extra spicy", price: 0.00),
  //         Addons(name: "Add on noodles", price: 1.00),
  //         Addons(name: "Add on Sunny-side up egg", price: 1.00),
  //       ]),

  //   // Rice
  // ];
  final List<Food> _menu = [];
  /*
  GETTERS
  */
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  /*
  OPERATIONS
  */
  // User cart
  final List<CartItem> _cart = [];

  //add to cart
  void addToCart(Food food, List<Addons> selectedAddons) {
    // Check if there's already a cart item with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if food item are same
      bool isSameFood = item.food == food;
      //check if addons are same
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    if (cartItem != null) {
      // Increment quantity if the item already exists
      cartItem.quantity++;
    } else {
      // Add new item to cart if it doesn't exist
      _cart.add(CartItem(food: food, selectedAddons: selectedAddons));
    }

    // Notify listeners to update UI
    notifyListeners();
  }

  // Remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // Get total price of cart
  double getTotalPrice() {
    double total = 0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addons addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  // Get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }

    return totalItemCount;
  }

  // Clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  /*
  HELPERS
  */
  // Generate receipt

  // Format double value into money

  // Format list of addons into a string summary
}
