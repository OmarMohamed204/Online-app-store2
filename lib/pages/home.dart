import 'package:flutter/material.dart';
import 'package:loginpages/model/cars.dart';
import 'package:loginpages/model/flowers.dart';
import 'package:loginpages/model/shirts.dart';
import 'package:loginpages/pages/checkout.dart';
import 'package:loginpages/pages/details_screen1.dart';
import 'package:loginpages/pages/details_screen2.dart';
import 'package:loginpages/pages/details_screen3.dart';
import 'package:loginpages/pages/favorite_items.dart';
import 'package:loginpages/pages/profile.dart';
import 'package:loginpages/provider/cart.dart';
import 'package:loginpages/provider/favorites.dart';
import 'package:loginpages/provider/theme.dart';
import 'package:loginpages/shared/appBar.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();

  List<Car> filteredCars = cars;
  List<Tshirt> filteredTshirts = tshirts;
  List<Flower> filteredFlowers = flowers;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          drawer: Drawer(
            child: Column(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/1246.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  accountName: Text(
                    "Omar",
                    style: TextStyle(color: Colors.black),
                  ),
                  accountEmail: Text(
                    "om3931930@gmail.com",
                    style: TextStyle(color: Colors.black),
                  ),

                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/maloul.jpg"),
                  ),
                  currentAccountPictureSize: Size.square(77),
                ),

                ListTile(
                  title: Text("Home"),
                  leading: Icon(Icons.home),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                ),

                ListTile(
                  title: Text("profile"),
                  leading: Icon(Icons.person),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Profile()),
                    );
                  },
                ),

                ListTile(
                  title: Text("My Products"),
                  leading: Icon(Icons.add_shopping_cart),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CheckOut()),
                    );
                  },
                ),

                ListTile(
                  title: Text("About"),
                  leading: Icon(Icons.help_center),
                  onTap: () {},
                ),

                ListTile(
                  title: Text("Favorits"),
                  leading: Icon(Icons.favorite),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FavoriteItems()),
                    );
                  },
                ),

                ListTile(
                  title: Text("Dark Mode"),
                  leading: Icon(Icons.dark_mode),
                  trailing: Consumer<ThemeProvider>(
                    builder: (context, val, child) {
                      return Switch(
                        activeThumbColor: Colors.green,
                        activeTrackColor: Colors.black,
                        inactiveThumbColor: Colors.red,
                        inactiveTrackColor: Colors.white,
                        value: val.isDark,
                        onChanged: (value) {
                          val.toggleTheme();
                        },
                      );
                    },
                  ),
                ),

                ListTile(
                  title: Text("Logout"),
                  leading: Icon(Icons.exit_to_app),
                  onTap: () {},
                ),

                Spacer(),

                Container(
                  padding: EdgeInsets.only(bottom: 14),
                  child: Text(
                    "Developed by Omar Mohamed © 2026",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),

          appBar: AppBar(
            bottom: TabBar(
              indicatorColor: Colors.purple,
              indicatorWeight: 6,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              labelStyle: TextStyle(fontSize: 20),
              unselectedLabelStyle: TextStyle(fontSize: 15),
              tabs: [
                Tab(
                  iconMargin: EdgeInsets.all(5),
                  icon: Icon(
                    Icons.car_crash_rounded,
                    size: 30,
                    color: Colors.deepOrange,
                  ),
                  text: "Cars",
                ),
                Tab(
                  iconMargin: EdgeInsets.all(5),
                  icon: Icon(
                    Icons.checkroom,
                    size: 30,
                    color: const Color.fromARGB(255, 46, 3, 133),
                  ),
                  text: "T-Shirts",
                ),
                Tab(
                  iconMargin: EdgeInsets.all(5),
                  icon: Icon(Icons.local_florist, size: 30, color: Colors.pink),
                  text: "flowers",
                ),
              ],
            ),
            backgroundColor: Color.fromARGB(255, 76, 141, 95),
            title: Text(
              "Home",
              style: TextStyle(
                color: Colors.white,
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [ProductAndPrice()],
          ),

          body: Column(
            children: [
              SizedBox(height: 7,),
              
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 60,
                  child: TextField(
                    controller: searchController,
                    
                    decoration: InputDecoration(
                      hintText: "Search for a product...",
                      prefix: Icon(Icons.search),
                      suffix: IconButton(
                        onPressed: () {
                          searchController.clear();
                          setState(() {
                            filteredCars = cars;
                            filteredFlowers = flowers;
                            filteredTshirts = tshirts;
                          });
                        },
                        icon: Icon(Icons.clear),
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        filteredCars = cars.where((car) {
                          return car.name.toLowerCase().contains(
                            value.toLowerCase(),
                          );
                        }).toList();

                        filteredTshirts = tshirts.where((shirt) {
                          return shirt.name.toLowerCase().contains(
                            value.toLowerCase(),
                          );
                        }).toList();

                        filteredFlowers = flowers.where((flower) {
                          return flower.name.toLowerCase().contains(
                            value.toLowerCase(),
                          );
                        }).toList();
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabBarView(
                    children: [
                      GridView.builder(
                        itemCount: filteredCars.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 40,
                          crossAxisCount: 1,
                          childAspectRatio: 3 / 2,
                        ),

                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => Details2(
                                    product_cars: filteredCars[index],
                                  )),
                                ),
                              );
                            },
                            child: GridTile(
                              footer: Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: GridTileBar(
                                  trailing: Row(
                                    children: [
                                      Consumer<Favorites>(
                                        builder: (context, value, child) {
                                          bool isFav = value.isFavorite(
                                            filteredCars[index],
                                          );

                                          return IconButton(
                                            onPressed: () {
                                              value.toggleFavorite(
                                                filteredCars[index],
                                              );

                                              bool isFavv = value.isFavorite(
                                                filteredCars[index],
                                              );

                                              ScaffoldMessenger.of(
                                                context,
                                              ).hideCurrentSnackBar();

                                              isFavv
                                                  ? ScaffoldMessenger.of(
                                                      context,
                                                    ).showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          "Item added from favorite",
                                                          style: TextStyle(
                                                            color: Colors.red,
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                        action: SnackBarAction(
                                                          label: "Cancel",
                                                          onPressed: () {
                                                            value.removeFavorite(
                                                              filteredCars[index],
                                                            );
                                                          },
                                                        ),

                                                        duration: Duration(
                                                          seconds: 3,
                                                        ),
                                                      ),
                                                    )
                                                  : ScaffoldMessenger.of(
                                                      context,
                                                    ).showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          "Item removed from favorite",
                                                          style: TextStyle(
                                                            color: Colors.red,
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                        action: SnackBarAction(
                                                          label: "Cancel",
                                                          onPressed: () {
                                                            value.addFavorite(
                                                              filteredCars[index],
                                                            );
                                                          },
                                                        ),

                                                        duration: Duration(
                                                          seconds: 3,
                                                        ),
                                                      ),
                                                    );

                                              Future.delayed(
                                                const Duration(seconds: 3),
                                                () {
                                                  if (context.mounted) {
                                                    ScaffoldMessenger.of(
                                                      context,
                                                    ).hideCurrentSnackBar();
                                                  }
                                                },
                                              );
                                            },
                                            icon: Icon(
                                              isFav
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: isFav
                                                  ? Colors.red
                                                  : Colors.white,
                                              size: 28,
                                            ),
                                          );
                                        },
                                      ),

                                      Consumer<Cart>(
                                        builder: (context, value, child) {
                                          return IconButton(
                                            onPressed: () {
                                              value.add(filteredCars[index]);

                                              ScaffoldMessenger.of(
                                                context,
                                              ).hideCurrentSnackBar();

                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    "Car addeed to card ✅",
                                                    style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 18,
                                                    ),
                                                  ),

                                                  action: SnackBarAction(
                                                    label: "Undo",
                                                    onPressed: () {
                                                      value.remove(
                                                        filteredCars[index],
                                                      );
                                                    },
                                                  ),

                                                  duration: const Duration(
                                                    seconds: 2,
                                                  ),
                                                ),
                                              );

                                              Future.delayed(
                                                const Duration(seconds: 2),
                                                () {
                                                  if (context.mounted) {
                                                    ScaffoldMessenger.of(
                                                      context,
                                                    ).hideCurrentSnackBar();
                                                  }
                                                },
                                              );
                                            },
                                            icon: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 33,
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  leading: Text(
                                    "\$ ${filteredCars[index].price}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),

                                  title: Text(
                                    " ${filteredCars[index].name}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: -2,
                                    right: 0,
                                    left: 0,
                                    bottom: 5,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: Image.asset(
                                        filteredCars[index].imgPath,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),

                      GridView.builder(
                        itemCount: filteredTshirts.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 40,
                          crossAxisCount: 1,
                          childAspectRatio: 3 / 3,
                        ),

                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => Details3(
                                    product_shirts: filteredTshirts[index],
                                  )),
                                ),
                              );
                            },
                            child: GridTile(
                              footer: GridTileBar(
                                trailing: Row(
                                  children: [
                                    Consumer<Favorites>(
                                      builder: (context, value, child) {
                                        bool isFav = value.isFavorite(
                                          filteredTshirts[index],
                                        );

                                        return IconButton(
                                          onPressed: () {
                                            value.toggleFavorite(
                                              filteredTshirts[index],
                                            );

                                            bool isFavv = value.isFavorite(
                                              filteredTshirts[index],
                                            );

                                            ScaffoldMessenger.of(
                                              context,
                                            ).hideCurrentSnackBar();

                                            isFavv
                                                ? ScaffoldMessenger.of(
                                                    context,
                                                  ).showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        "Item added from favorite",
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      action: SnackBarAction(
                                                        label: "Cancel",
                                                        onPressed: () {
                                                          value.removeFavorite(
                                                            filteredTshirts[index],
                                                          );
                                                        },
                                                      ),

                                                      duration: Duration(
                                                        seconds: 3,
                                                      ),
                                                    ),
                                                  )
                                                : ScaffoldMessenger.of(
                                                    context,
                                                  ).showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        "Item removed from favorite",
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      action: SnackBarAction(
                                                        label: "Cancel",
                                                        onPressed: () {
                                                          value.addFavorite(
                                                            filteredTshirts[index],
                                                          );
                                                        },
                                                      ),

                                                      duration: Duration(
                                                        seconds: 3,
                                                      ),
                                                    ),
                                                  );

                                            Future.delayed(
                                              const Duration(seconds: 3),
                                              () {
                                                if (context.mounted) {
                                                  ScaffoldMessenger.of(
                                                    context,
                                                  ).hideCurrentSnackBar();
                                                }
                                              },
                                            );
                                          },
                                          icon: Icon(
                                            isFav
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: isFav
                                                ? Colors.red
                                                : Colors.grey,
                                            size: 28,
                                          ),
                                        );
                                      },
                                    ),

                                    Consumer<Cart>(
                                      builder: (context, value, child) {
                                        return IconButton(
                                          onPressed: () {
                                            value.add(filteredTshirts[index]);

                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  "T-Shirt added to card ✅",
                                                  style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                action: SnackBarAction(
                                                  label: "Undo",
                                                  onPressed: () {
                                                    value.remove(
                                                      filteredTshirts[index],
                                                    );
                                                  },
                                                ),
                                                duration: Duration(seconds: 2),
                                              ),
                                            );

                                            Future.delayed(
                                              const Duration(seconds: 2),
                                              () {
                                                if (context.mounted) {
                                                  ScaffoldMessenger.of(
                                                    context,
                                                  ).hideCurrentSnackBar();
                                                }
                                              },
                                            );
                                          },
                                          icon: Icon(
                                            Icons.add,
                                            color: Colors.purple,
                                            size: 33,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),

                                leading: Text(
                                  "\$ ${filteredTshirts[index].price}",
                                  style: TextStyle(
                                    color: Colors.purple,
                                    fontSize: 20,
                                  ),
                                ),

                                title: Text(
                                  " ${filteredTshirts[index].name}",
                                  style: TextStyle(
                                    color: Colors.purple,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: -2,
                                    right: 0,
                                    left: 0,
                                    bottom: 5,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: Image.asset(
                                        filteredTshirts[index].imgPath,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),

                      GridView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: filteredFlowers.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 40,
                          crossAxisCount: 1,
                          // childAspectRatio: 3 / 2,
                        ),

                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => Details1(
                                    product_flower: filteredFlowers[index],
                                  )),
                                ),
                              );
                            },
                            child: GridTile(
                              footer: GridTileBar(
                                trailing: Row(
                                  children: [
                                    Consumer<Favorites>(
                                      builder: (context, value, child) {
                                        bool isFav = value.isFavorite(
                                          filteredFlowers[index],
                                        );

                                        return IconButton(
                                          onPressed: () {
                                            value.toggleFavorite(
                                              filteredFlowers[index],
                                            );

                                            bool isFavv = value.isFavorite(
                                              filteredFlowers[index],
                                            );

                                            ScaffoldMessenger.of(
                                              context,
                                            ).hideCurrentSnackBar();

                                            isFavv
                                                ? ScaffoldMessenger.of(
                                                    context,
                                                  ).showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        "Item added from favorite",
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      action: SnackBarAction(
                                                        label: "Cancel",
                                                        onPressed: () {
                                                          value.removeFavorite(
                                                            filteredFlowers[index],
                                                          );
                                                        },
                                                      ),

                                                      duration: Duration(
                                                        seconds: 3,
                                                      ),
                                                    ),
                                                  )
                                                : ScaffoldMessenger.of(
                                                    context,
                                                  ).showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        "Item removed from favorite",
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize: 18,
                                                        ),
                                                      ),
                                                      action: SnackBarAction(
                                                        label: "Cancel",
                                                        onPressed: () {
                                                          value.addFavorite(
                                                            filteredFlowers[index],
                                                          );
                                                        },
                                                      ),

                                                      duration: Duration(
                                                        seconds: 3,
                                                      ),
                                                    ),
                                                  );

                                            Future.delayed(
                                              const Duration(seconds: 3),
                                              () {
                                                if (context.mounted) {
                                                  ScaffoldMessenger.of(
                                                    context,
                                                  ).hideCurrentSnackBar();
                                                }
                                              },
                                            );
                                          },
                                          icon: Icon(
                                            isFav
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: isFav
                                                ? Colors.red
                                                : Colors.black,
                                            size: 28,
                                          ),
                                        );
                                      },
                                    ),

                                    Consumer<Cart>(
                                      builder: (context, value, child) {
                                        return IconButton(
                                          onPressed: () {
                                            value.add(filteredFlowers[index]);

                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  "Flower addeed to card ✅",
                                                  style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                action: SnackBarAction(
                                                  label: "Undo",
                                                  onPressed: () {
                                                    value.remove(
                                                      filteredFlowers[index],
                                                    );
                                                  },
                                                ),

                                                duration: Duration(seconds: 2),
                                              ),
                                            );

                                            Future.delayed(
                                              const Duration(seconds: 2),
                                              () {
                                                if (context.mounted) {
                                                  ScaffoldMessenger.of(
                                                    context,
                                                  ).hideCurrentSnackBar();
                                                }
                                              },
                                            );
                                          },
                                          icon: Icon(
                                            Icons.add,
                                            color: Colors.black,
                                            size: 33,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),

                                leading: Text(
                                  "\$ ${filteredFlowers[index].price}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),

                                title: Text(
                                  " ${filteredFlowers[index].name}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: -2,
                                    right: 0,
                                    left: 0,
                                    bottom: 5,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: Image.asset(
                                        filteredFlowers[index].imgPath,
                                      ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
