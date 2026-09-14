import 'package:flutter/material.dart';
import 'package:loginpages/model/cars.dart';
import 'package:loginpages/provider/cart.dart';
import 'dart:math';

import 'package:provider/provider.dart';

class ConfirmPay extends StatelessWidget {
  final String customerName;
  final String phone;
  final String address;
  final String paymentMethod;

  const ConfirmPay({
    super.key,
    required this.customerName,
    required this.phone,
    required this.address,
    required this.paymentMethod,
  });

  String generateOrderId() {
    final random = Random();
    return "ORD-${100000 + random.nextInt(900000)}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "confirmation massage",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.grey.shade300,

      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(25.0),

              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15.0),
              ),

              child: Column(
                children: [
                  const Icon(Icons.check_circle, color: Colors.green, size: 30),

                  const SizedBox(height: 20),

                  const Text(
                    "Order Confirmed!",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "Order Id ${generateOrderId()}",
                    style: const TextStyle(fontSize: 18, color: Colors.orange),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Customer: $customerName",
                    style: const TextStyle(fontSize: 18, color: Colors.orange),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Phone: $phone",
                    style: const TextStyle(fontSize: 18, color: Colors.orange),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Address: $address",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18, color: Colors.orange),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Payment: $paymentMethod",
                    style: const TextStyle(fontSize: 18, color: Colors.orange),
                  ),

                  const SizedBox(height: 8),

                  Consumer<Cart>(
                    builder: (context, value, child) {
                      return Text(
                        "Price \$ ${value.pricee}",
                        style: TextStyle(color: Colors.orange, fontSize: 18),
                      );
                    },
                  ),

                  const SizedBox(height: 25.0),

                  const Text(
                    "Your order has been confirmed.\nYou Will receive a confirmation SMS.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
