import 'package:loginpages/pages/pay_confirm.dart';
import 'package:loginpages/provider/cart.dart';
import 'package:loginpages/shared/appBar.dart';
import 'package:loginpages/shared/colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  String paymentMethod = "Cash on Delivery";

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  void placeOrder() {
    if (nameController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty ||
        addressController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please complete all you information")),
      );
      return;
    }

    if (phoneController.text.trim().length < 11 ||
        phoneController.text.trim().length > 11) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid phone number")),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ConfirmPay(
          customerName: nameController.text.trim(),
          phone: phoneController.text.trim(),
          address: addressController.text.trim(),
          paymentMethod: paymentMethod,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: Text(
          "Check Out",
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [ProductAndPrice()],
      ),

      body: value.selectedItems.isEmpty
          ? Center(
              child: Text("No Items Added !!", style: TextStyle(fontSize: 22)),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 5),

                  Center(
                    child: Text(
                      "Total Added Items { ${value.selectedItems.length} }",
                      style: TextStyle(fontSize: 22, color: Colors.deepPurple),
                    ),
                  ),

                  SingleChildScrollView(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        // =========================
                        // PRODUCTS
                        // =========================

                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: value.selectedItems.length,

                          itemBuilder: (BuildContext context, int index) {
                            final product = value.selectedItems[index];
                            final quantity = value.quantities[index];

                            return Card(
                              child: ListTile(
                                title: Text(product.name),
                                subtitle: Text(
                                  "\$ ${product.price} - ${product.location}",
                                ),

                                leading: CircleAvatar(
                                  backgroundImage: AssetImage(
                                    value.selectedItems[index].imgPath,
                                  ),
                                ),

                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        value.remove(product);
                                      },
                                      icon: Icon(
                                        Icons.remove_circle,
                                        color: Colors.red,
                                      ),
                                    ),

                                    Text(
                                      '$quantity',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    IconButton(
                                      onPressed: () {
                                        value.add(product);
                                      },
                                      icon: Icon(
                                        Icons.add_circle,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  // =========================
                  // CUSTOMER INFORMATION
                  // =========================
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Customer Information",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "Full Name",
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        prefixIcon: const Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: addressController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        labelText: "Delivery Address",
                        prefixIcon: const Icon(Icons.location_on),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // =========================
                  // PAYMENT METHOD
                  // =========================
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Payment Method",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  RadioListTile<String>(
                    value: "Cash on Delivery",
                    // ignore: deprecated_member_use
                    groupValue: paymentMethod,
                    title: const Text("Cash on Delivery"),
                    secondary: const Icon(Icons.money),
                    // ignore: deprecated_member_use
                    onChanged: (value) {
                      setState(() {
                        paymentMethod = value!;
                      });
                    },
                  ),

                  RadioListTile<String>(
                    value: "online payment",
                    // ignore: deprecated_member_use
                    groupValue: paymentMethod,
                    title: const Text("Visa / Mastercard"),
                    secondary: const Icon(Icons.credit_card),
                    // ignore: deprecated_member_use
                    onChanged: (value) {
                      setState(() {
                        paymentMethod = value!;
                      });
                    },
                  ),

                  const SizedBox(height: 20),

                  // =========================
                  // TOTAL
                  // =========================
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      // color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          "\$ ${value.pricee}",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // =========================
                  // PLACE ORDER
                  // =========================
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: placeOrder,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: BTNpink,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(10),
                        ),
                      ),
                      child: Text(
                        paymentMethod == "Cash on Delivery"
                            ? "place order"
                            : "Continue to payment",
                        style: const TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
