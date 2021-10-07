import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_Us' : {
     'appBar': 'All Product List',
     'cart': 'Add To Cart',
      'amount' : 'Total Amount',
      'price' : 'Price'
    },
  'hi_In': {
    'appBar': 'सभी उत्पाद सूची',
    'cart': 'कार्ट में जोड़ें',
    'amount' : 'कुल राशि',
  'price' : 'राशि'
  },
  'es_PR': {
    'appBar': 'Lista de todos los productos',
    'cart': 'Añadir al carrito',
    'amount' : 'Cantidad total',
    'price' : 'Cantidad'
  },
    'tr_TR': {
      'appBar': 'Tüm Ürün Listesi',
      'cart': 'Sepete ekle',
      'amount' : 'Toplam tutar',
      'price' : 'Fiyat'
    }
  };
}