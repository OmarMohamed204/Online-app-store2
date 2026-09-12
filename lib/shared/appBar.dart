import 'package:flutter/material.dart';
import 'package:loginpages/pages/checkout.dart';
import 'package:loginpages/pages/favorite_items.dart';
import 'package:loginpages/pages/notifications.dart';
import 'package:loginpages/provider/cart.dart';
import 'package:loginpages/provider/favorites.dart';
import 'package:provider/provider.dart';

class ProductAndPrice extends StatelessWidget {
  const ProductAndPrice({super.key});

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<Cart>(context);
    final valuee = Provider.of<Favorites>(context);

    final notificationCount =
        value.notifications_add.length + valuee.notifications_Fav.length;

    return Row(
      children: [
        Stack(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckOut()),
                );
              },
              icon: Icon(
                Icons.add_shopping_cart,
                color: Colors.white,
                size: 30,
              ),
            ),

            if (value.itemCount > 0)
              Positioned(
                bottom: 22,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "${value.itemCount}",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Text(
            "\$ ${value.pricee}",
            style: TextStyle(color: Colors.white, fontSize: 19),
          ),
        ),
        Stack(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Notifications()),
                );
              },
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
                size: 30,
              ),
            ),

            if (notificationCount > 0)
              Positioned(
                right: 5,
                top: 3,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),

                  child: Text(
                    "$notificationCount",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
