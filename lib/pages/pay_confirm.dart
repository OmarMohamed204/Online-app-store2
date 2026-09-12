import 'package:flutter/material.dart';

class ConfirmPay extends StatelessWidget {
  const ConfirmPay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("confirmation massage", style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      backgroundColor: Colors.grey,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              "Your order has been confirmed. You will receive a confirmation SMS",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
