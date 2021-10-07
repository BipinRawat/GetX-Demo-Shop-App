 import 'package:get/get.dart';
import 'package:getx_statemanagement/model/product_model.dart';

class ProductController extends GetxController {
  List <Product> prodcutData = [];

  List<Product> cartItem = List<Product>.empty().obs;

  addToCart(Product item){
    cartItem.add(item);
  }

  double get totalPrice => cartItem.fold(0,(sum, item) => sum + item.price);
  int get count => cartItem.length;

@override
void onInit() {
  super.onInit();
  fetchProductData();
}


  fetchProductData() async {
await Future.delayed(Duration(seconds: 5));



  List<Product> serverResponse = [
  Product (
    id: 1,
    price:499,
    productDescription: 'Some Description',
    productImage: "https://images.unsplash.com/photo-1523381210434-271e8be1f52b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8dHNoaXJ0fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60",
    productName: "T-shirt",
      favorite: false
  ),

    Product (
        id: 2,
        price:599,
        productDescription: 'Some Description',
        productImage: "https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8c2hvZXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60",
        productName: "Shoes",
        favorite: false
    ),

    Product (
        id: 3,
        price:699,
        productDescription: 'Some Description',
        productImage: "https://images.unsplash.com/photo-1605518215584-5ba74df5dfd8?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHBhbnRzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60",
        productName: "Pant",
        favorite: false
    ),

    Product (
        id: 4,
        price:799,
        productDescription: 'Some Description',
        productImage: "https://images.unsplash.com/photo-1603252110481-7ba873bf42ab?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fHNoaXJ0fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60",
        productName: "Shirt",
        favorite: false
    ),

    Product (
        id: 5,
        price:899,
        productDescription: 'Some Description',
        productImage: "https://images.unsplash.com/photo-1551028719-00167b16eac5?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8amFja2V0fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=60",
        productName: "Jacket",
        favorite: false
    ),

    ];
  prodcutData.assignAll(serverResponse);
  print(prodcutData);
  update();
  }
  addToFavorites(id){
  var index = prodcutData.indexWhere((element) => element.id== id);
  prodcutData[index].favorite = !prodcutData[index].favorite;
  update();
  }

  }
