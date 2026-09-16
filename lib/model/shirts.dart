class Tshirt {
  String imgPath;
  String price;
  String name;
  String location;

  Tshirt({
    required this.imgPath,
    required this.price,
    this.name = "Shirt#",
    this.location = "Main branch",
  });
}

final List<Tshirt> tshirts = [
  Tshirt(
    name: "Shirt1",
    imgPath: "assets/images/shirt4.jpg",
    price: "7.00",
    location: "T-Shirts Shop",
  ),
  Tshirt(name: "Shirt2", imgPath: "assets/images/shirt5.jpg", price: "4.00"),
  Tshirt(
    name: "Shirt3",
    imgPath: "assets/images/shirt6.jpg",
    price: "6.00",
    location: "T-Shirts Shop",
  ),
  Tshirt(name: "Shirt4", imgPath: "assets/images/shirt7.jpg", price: "2.00"),
  Tshirt(
    name: "Shirt5",
    imgPath: "assets/images/shirt8.jpg",
    price: "8.00",
    location: "T-Shirts Shop",
  ),
  Tshirt(
    name: "Shirt6",
    imgPath: "assets/images/shirt1.jpg",
    price: "5.00",
    location: "T-Shirts Shop",
  ),
  Tshirt(imgPath: "assets/images/shirt2.jpg", price: "3.00"),
  Tshirt(
    name: "Shirt7",
    imgPath: "assets/images/shirt3.jpg",
    price: "1.00",
    location: "T-Shirts Shop",
  ),
];
