import 'dart:io';

import 'package:flutter/material.dart';
import 'package:neuc_cuisine/OrderConfirmationPage.dart';
import 'package:neuc_cuisine/models/restaurant.dart';
import 'package:neuc_cuisine/payment_config.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';

class payment extends StatefulWidget {
  const payment({super.key});

  @override
  State<payment> createState() => _paymentState();
}

class _paymentState extends State<payment> {
  String os = Platform.operatingSystem;

  var applePayButton = ApplePayButton(
    paymentConfiguration: PaymentConfiguration.fromJsonString(defaultApplePay),
    paymentItems: const [
      PaymentItem(
        label: 'item A',
        amount: '0.01',
        status: PaymentItemStatus.final_price,
      ),
      PaymentItem(
        label: 'item B',
        amount: '0.01',
        status: PaymentItemStatus.final_price,
      ),
      PaymentItem(
        label: 'Total',
        amount: '0.02',
        status: PaymentItemStatus.final_price,
      ),
    ],
    style: ApplePayButtonStyle.black,
    width: double.infinity,
    height: 50,
    type: ApplePayButtonType.buy,
    margin: const EdgeInsets.only(top: 15.0),
    onPaymentResult: (result) => debugPrint('Payment Result $result'),
    loadingIndicator: const Center(
      child: CircularProgressIndicator(),
    ),
  );

  var googlePayButton = GooglePayButton(
    paymentConfiguration: PaymentConfiguration.fromJsonString(defaultGooglePay),
    paymentItems: const [
      PaymentItem(
        label: 'item A',
        amount: '0.01',
        status: PaymentItemStatus.final_price,
      ),
    ],
    width: double.infinity,
    type: GooglePayButtonType.pay,
    margin: const EdgeInsets.only(top: 15.0),
    onPaymentResult: (result) => debugPrint('Payment Result $result'),
    loadingIndicator: const Center(
      child: CircularProgressIndicator(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFFED4545),
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Platform.isIOS ? applePayButton : googlePayButton,
            ),
            SizedBox(height: 50), // Space between buttons
            MaterialButton(
              onPressed: () {
                // lear the cart and navigate to order confirmation page
                final restaurant =
                    Provider.of<Restaurant>(context, listen: false);
                restaurant.clearCart();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderConfirmationPage(),
                  ),
                );
              },
              color: Color(0xFFED4545), // Button color
              textColor: Colors.white, // Button text color
              padding: EdgeInsets.all(16.0), // Button padding
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0), // Border radius
              ),
              child: Text(
                'Proceed to Confirmation',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
