import 'package:flutter/material.dart';
import 'package:get/get.dart' ;
import 'package:getx_statemanagement/controller/product_controller.dart';

class ProductScreen extends StatelessWidget {
  final productController = Get.put(ProductController());

final List locales = [
  {'name': 'English', 'locale': Locale('en', 'US')},
  {'name': 'Hindi', 'locale': Locale('hi', 'IN')},
  {'name': 'Turkish', 'locale': Locale('tr', 'TR')},
  {'name': 'Spanish', 'locale': Locale('es', 'PR')}
];

  showLocaleDialog(BuildContext context){
    showDialog(context: context,
        builder: (_) => AlertDialog(
    title : Text("Choose Your Language"),
      content: Container(
        width: double.maxFinite,
        child: ListView.separated(
          shrinkWrap: true,
            itemBuilder: (context, index) => InkWell(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(locales[index]['name'].toString()),
              ),
              onTap: () => updateLocale(locales[index]['locale'],context)
            ),
            separatorBuilder: (context, index) => Divider(
            color: Colors.black,
        ),
            itemCount: 4,
          ),
      ),
    ),
    );
  }
  updateLocale(Locale locale, BuildContext context){
    Navigator.of(context).pop();
    Get.updateLocale(locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        // centerTitle: true,
        title: Text("appBar".tr),
        actions: [
          Row(
            children: [
              ElevatedButton.icon(onPressed: (){},
                  icon: Icon(Icons.shopping_cart),
              label: GetX<ProductController>(
                builder: (controller) =>Text(productController.count.toString())
              ),
              ),
              ElevatedButton.icon(onPressed: () => showLocaleDialog(context),
              icon: Icon(Icons.language),
                label: Text(""),
              )
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: GetBuilder<ProductController>
                (builder: (controller){

             return  ListView.builder(itemBuilder: (context,index) {
                  return Container(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Theme.of(context).primaryColor,width: 1
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      elevation: 5,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 120,
                            width: double.infinity,
                            child: Image.network(
                              productController.prodcutData[index].productImage,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  productController.prodcutData[index].productName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                IconButton(icon: Icon(
                                  productController.prodcutData[index].favorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.red,
                                ),
                                    onPressed: (){
                                  productController.addToFavorites(productController.prodcutData[index].id);
                                    })
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'price : ${productController.prodcutData[index].price}'.tr,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                ElevatedButton(onPressed: (){
                                  productController.addToCart(productController.prodcutData[index]);
                                },
                                    child: Text("cart".tr,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    )
                                )
                              ],
                            ),

                          )
                        ],
                      ),
                    ),
                  );
                },
                  itemCount: productController.prodcutData.length,
                );
    },)

    ),
          SizedBox(
      height: 10,
          ),
          GetX<ProductController>(
              builder: (controller) => Text("amount:${productController.totalPrice}".tr,
                style: TextStyle(fontSize: 20,color: Colors.white)
              ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
