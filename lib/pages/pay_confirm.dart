import 'package:flutter/material.dart';
import 'package:loginpages/l10n/app_localizations.dart';
import 'package:loginpages/model/cars.dart';
import 'package:loginpages/pages/home.dart';
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
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      backgroundColor: Colors.grey.shade300,

      appBar: AppBar(
        title: Text(
          l10n.confirmationMessage,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
        },

        child: Icon(Icons.home),
      ),

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

                  Text(
                    l10n.orderConfirmed,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "${l10n.orderId} ${generateOrderId()}",
                    style: const TextStyle(fontSize: 18, color: Colors.orange),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "${l10n.customer} $customerName",
                    style: const TextStyle(fontSize: 18, color: Colors.orange),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "${l10n.phone} $phone",
                    style: const TextStyle(fontSize: 18, color: Colors.orange),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "${l10n.address} $address",
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18, color: Colors.orange),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "${l10n.payment} $paymentMethod",
                    style: const TextStyle(fontSize: 18, color: Colors.orange),
                  ),

                  const SizedBox(height: 8),

                  Consumer<Cart>(
                    builder: (context, value, child) {
                      return Text(
                        "${l10n.price} \$ ${value.pricee}",
                        style: TextStyle(color: Colors.orange, fontSize: 18),
                      );
                    },
                  ),

                  const SizedBox(height: 25.0),

                  Text(
                    l10n.orderConfirmationText,
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
