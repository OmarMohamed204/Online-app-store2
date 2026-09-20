import 'package:flutter/material.dart';
import 'package:loginpages/l10n/app_localizations.dart';
import 'package:loginpages/model/flowers.dart';
import 'package:loginpages/shared/appBar.dart';

// ignore: must_be_immutable
class Details1 extends StatefulWidget {
  // ignore: non_constant_identifier_names
  Flower product_flower;

  Details1({super.key, required this.product_flower});

  @override
  State<Details1> createState() => _DetailsState();
}

class _DetailsState extends State<Details1> {
  bool isShowMore = true;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 76, 141, 95),
        title: Text(
          l10n.detailsScreen,
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [ProductAndPrice()],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(widget.product_flower.imgPath),

            SizedBox(height: 15),

            Text(
              "\$ ${widget.product_flower.price}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 15),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 251, 115, 115),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      l10n.newItem,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 13),

                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 25),
                    Icon(Icons.star, color: Colors.amber, size: 25),
                    Icon(Icons.star, color: Colors.amber, size: 25),
                    Icon(Icons.star, color: Colors.amber, size: 25),
                    Icon(Icons.star, color: Colors.amber, size: 25),
                  ],
                ),

                Spacer(),

                Row(
                  children: [
                    Icon(Icons.edit_location),

                    SizedBox(width: 10),

                    Text(
                      widget.product_flower.location,
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(width: 15),
                  ],
                ),
              ],
            ),

            SizedBox(height: 8.0),

            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  l10n.details,
                  style: TextStyle(fontSize: 22),
                  textAlign: TextAlign.start,
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.all(12),
              child: Text(
                l10n.flowerDetails,
                style: TextStyle(fontSize: 20),
                maxLines: isShowMore ? 3 : null,
                overflow: TextOverflow.fade,
              ),
            ),

            TextButton(
              onPressed: () {
                setState(() {
                  isShowMore = !isShowMore;
                });
              },
              child: Text(
                isShowMore ? l10n.showMore : l10n.showLess,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
