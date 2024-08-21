import 'package:flutter/material.dart';
import 'package:neuc_cuisine/cartItems.dart';
import 'package:neuc_cuisine/checkOut.dart'; // Import CartItem

class Status extends StatelessWidget {
  final List<CartItem> cartItems;

  const Status({Key? key, required this.cartItems}) : super(key: key);

  double getTotalCartPrice() {
    return cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  @override
  Widget build(BuildContext context) {
    final totalCartPrice = getTotalCartPrice();

    return Scaffold(
      appBar: AppBar(
        title: Text("S T A T U S"),
        backgroundColor: Color(0xFFED4545),
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: cartItems.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Your food is placed",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFED4545),
                      ),
                    ),
                    Text(
                      "Please wait...",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFED4545),
                      ),
                    ),
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final cartItem = cartItems[index];
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 5.0),
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  cartItem.food
                                      .imagePath, // Ensure this URL is correct and accessible
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Center(
                                      child:
                                          Icon(Icons.error, color: Colors.red),
                                    );
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cartItem.food.name,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Price: \$${cartItem.food.price.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    // Display selected addons
                                    if (cartItem.selectedAddons.isNotEmpty) ...[
                                      Text(
                                        'Addons:',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.0,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: cartItem.selectedAddons
                                            .map((addon) {
                                          return Text(
                                            '${addon.name} - \$${addon.price.toStringAsFixed(2)}',
                                            style: TextStyle(
                                              color: Colors.grey[600],
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Quantity: ${cartItem.quantity}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    padding: EdgeInsets.all(5.0),
                                    width: 80,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                      child: Text(
                                        "Pending",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CheckOut(totalPrice: totalCartPrice),
                          // Status(cartItems: userCart),
                        ),
                      ); //to payment page
                    },
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
                    child: Text('Checkout'),
                  ),
                  SizedBox(height: 20),
                ],
              ),
      ),
    );
  }
}






// import 'package:flutter/material.dart';

// class Status extends StatelessWidget {
//   const Status({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("S T A T U S"),
//         backgroundColor: Color(0xFFED4545),
//         foregroundColor: Colors.white,
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(Icons.arrow_back_ios)),
//       ),
//       backgroundColor: Colors.grey[200],
//       body: Padding(
//         padding: EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 10,
//             ),


//             Column(
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(8.0),
//                   height: 100,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10)),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Image.asset('name'),
//                       Column(
//                         children: [Text("Name"), Text("Price")],
//                       ),
//                       Container(
//                         padding: EdgeInsets.all(5.0),
//                         width: 80,
//                         height: 30,
//                         decoration: BoxDecoration(
//                             color: Colors.red,
//                             borderRadius: BorderRadius.circular(20)),
//                         child: Center(
//                           child: Text(
//                             "Pending",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(8.0),
//                   height: 100,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10)),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Image.asset('name'),
//                       Column(
//                         children: [Text("Name"), Text("Price")],
//                       ),
//                       Container(
//                         padding: EdgeInsets.all(5.0),
//                         width: 80,
//                         height: 30,
//                         decoration: BoxDecoration(
//                             color: Colors.red,
//                             borderRadius: BorderRadius.circular(20)),
//                         child: Center(
//                           child: Text(
//                             "Pending",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(8.0),
//                   height: 100,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10)),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Image.asset('name'),
//                       Column(
//                         children: [Text("Name"), Text("Price")],
//                       ),
//                       Container(
//                         padding: EdgeInsets.all(5.0),
//                         width: 80,
//                         height: 30,
//                         decoration: BoxDecoration(
//                             color: Colors.red,
//                             borderRadius: BorderRadius.circular(20)),
//                         child: Center(
//                           child: Text(
//                             "Pending",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(8.0),
//                   height: 100,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10)),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Image.asset('name'),
//                       Column(
//                         children: [Text("Name"), Text("Price")],
//                       ),
//                       Container(
//                         padding: EdgeInsets.all(5.0),
//                         width: 80,
//                         height: 30,
//                         decoration: BoxDecoration(
//                             color: Colors.red,
//                             borderRadius: BorderRadius.circular(20)),
//                         child: Center(
//                           child: Text(
//                             "Pending",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
