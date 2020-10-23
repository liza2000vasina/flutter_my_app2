import 'dart:collection';

import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier{

  final String id;
  final String title;
  final String description;
  final String imgUrl;
  final num price;
  final color;

  Product({
      @required this.id,
      @required this.title,
      @required this.description,
      @required this.imgUrl,
      @required this.price,
      @required this.color
  });

}

class ProductDataProvider with ChangeNotifier{
  List <Product> _items = [
    Product(
      id: 'p3',
      title: 'With mushrooms',
      description: ' You will get real pleasure when you try!',
      price: 250.00,
      imgUrl: 'http://fan-pizza.com.ua/uploads/products/11.png',
      color: '0xFFF8BBD0',
    ),
    Product(
      id: 'p1',
      title: 'White mushrooms',
      description: 'You will get real pleasure when you try!',
      price: 300.00,
      imgUrl: 'http://fan-pizza.com.ua/uploads/products/89.png',
      color: '0xFFF8BBD0',
    ),
    Product(
      id: 'p2',
      title: 'Italy',
      description: 'You will get real pleasure when you try!',
      price: 275.00,
      imgUrl: 'http://fan-pizza.com.ua/uploads/products/90.png',
      color: '0xFFF8BBD0',
    ),
    Product(
      id: 'p4',
      title: 'Carbonara',
      description: ' You will get real pleasure when you try!',
      price: 350.00,
      imgUrl: 'http://fan-pizza.com.ua/uploads/products/20.png',
      color: '0xFFF8BBD0',
    ),
  ];

  //list can not be changed, getter
  UnmodifiableListView<Product> get items => UnmodifiableListView(_items);

  Product getElementById(String id)
    => _items.singleWhere((value) => value.id == id);

}