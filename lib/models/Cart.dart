import 'dart:collection';

import 'package:flutter/cupertino.dart';

class Cart{
  final String id;
  final String title;
  final int number;
  final num price;
  final String imgUrl;

  Cart({
  @required this.id,
  @required this.title,
  @required this.number,
  @required this.price,
  @required this.imgUrl
  });

}

//Cart provider

class CartDataProvider with ChangeNotifier{
 
  Map<String, Cart> _cartItems = {};

  UnmodifiableMapView<String, Cart> get cartItems =>
    UnmodifiableMapView(_cartItems);
  
  int get cartItemsCount => _cartItems.length;


  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, value) {
      total += value.price + value.number;
    });
    return total;
  }

  void addItem({productId, price, title, imgUrl}){
    if(_cartItems.containsKey(productId)){
      _cartItems.update(productId, (ex) => Cart(
          id: ex.id,
          title: ex.title,
          number: ex.number + 1,
          price: ex.price,
          imgUrl: ex.imgUrl));
    }
    else {
      _cartItems.putIfAbsent(productId, () => Cart(
          id: '${DateTime.now()}',
          title: title,
          number: 1,
          price: price,
          imgUrl: imgUrl));
    }
    notifyListeners();
  }

  void deleteItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  // Обновить корзину на +1 единицу товара по id
  void updateItemsAddOne(String productId) {
    _cartItems.update(
      productId,
          (ex) => Cart(
        id: ex.id,
        title: ex.title,
        price: ex.price,
        imgUrl: ex.imgUrl,
        number: ex.number + 1,
      ),
    );
    notifyListeners();
  }

  // Обновить корзину на -1 единицу товара по id
  void updateItemsSubOne(String productId) {
    if (_cartItems[productId].number < 2) {
      deleteItem(productId);
    } else {
      _cartItems.update(
        productId,
            (ex) => Cart(
          id: ex.id,
          title: ex.title,
          price: ex.price,
          imgUrl: ex.imgUrl,
          number: ex.number - 1,
        ),
      );
    }
    notifyListeners();
  }

  void clear() {
    _cartItems = {};
    notifyListeners();
  }
}

