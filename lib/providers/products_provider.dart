// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/cupertino.dart';

import '../models/products_model.dart';

class ProductsProvider with ChangeNotifier {
  List<ProductModel> get getProducts {
    return _productsList;
  }

  List<ProductModel> get getOnSaleProducts {
    return _productsList.where((element) => element.isOnSale).toList();
  }

  ProductModel findProdById(String productId) {
    return _productsList.firstWhere((element) => element.id == productId);
  }

  List<ProductModel> findByCategory(String categoryName) {
    List<ProductModel> _categoryList = _productsList
        .where((element) => element.productCategoryName
            .toLowerCase()
            .contains(categoryName.toLowerCase()))
        .toList();
    return _categoryList;
  }

  static final List<ProductModel> _productsList = [
    ProductModel(
      id: 'book',
      title: 'book',
      price: 0.99,
      salePrice: 0.49,
      imageUrl: 'assets/images/sale/book1.png',
      productCategoryName: 'Books',
      isOnSale: true,
      isPiece: false,
    ),
    ProductModel(
      id: 'famaous five',
      title: 'famaous five',
      price: 0.88,
      salePrice: 0.5,
      imageUrl: 'assets/images/sale/book1.png',
      productCategoryName: 'Books',
      isOnSale: false,
      isPiece: true,
    ),
    ProductModel(
      id: 'Apple',
      title: 'Apple',
      price: 1.22,
      salePrice: 0.7,
      imageUrl: 'assets/images/sale/phone.png',
      productCategoryName: 'Mobiles',
      isOnSale: true,
      isPiece: false,
    ),
    ProductModel(
      id: 'books',
      title: 'books',
      price: 1.5,
      salePrice: 0.5,
      imageUrl: 'assets/images/sale/book1.png',
      productCategoryName: 'Books',
      isOnSale: true,
      isPiece: false,
    ),
    ProductModel(
      id: 'Green grape',
      title: 'Green grape',
      price: 0.99,
      salePrice: 0.4,
      imageUrl: 'assets/images/sale/phone.png',
      productCategoryName: 'Fruits',
      isOnSale: false,
      isPiece: false,
    ),
    ProductModel(
      id: 'Red apple',
      title: 'Red apple',
      price: 0.6,
      salePrice: 0.2,
      imageUrl: 'assets/images/sale/phone.png',
      productCategoryName: 'Fruits',
      isOnSale: true,
      isPiece: false,
    ),
    // Vegi
    ProductModel(
      id: 'Carottes',
      title: 'Carottes',
      price: 0.99,
      salePrice: 0.5,
      imageUrl: 'assets/images/sale/phone.png',
      productCategoryName: 'Vegetables',
      isOnSale: true,
      isPiece: false,
    ),
    ProductModel(
      id: 'Cauliflower',
      title: 'Cauliflower',
      price: 1.99,
      salePrice: 0.99,
      imageUrl: 'assets/images/sale/phone.png',
      productCategoryName: 'Vegetables',
      isOnSale: false,
      isPiece: true,
    ),
    ProductModel(
      id: 'Cucumber',
      title: 'Cucumber',
      price: 0.99,
      salePrice: 0.5,
      imageUrl: 'assets/images/sale/phone.png',
      productCategoryName: 'Vegetables',
      isOnSale: false,
      isPiece: false,
    ),
    ProductModel(
      id: 'Jalape',
      title: 'Jalape',
      price: 1.99,
      salePrice: 0.89,
      imageUrl: 'assets/images/sale/phone.png',
      productCategoryName: 'Vegetables',
      isOnSale: false,
      isPiece: false,
    ),
    ProductModel(
      id: 'Long yam',
      title: 'Long yam',
      price: 2.99,
      salePrice: 1.59,
      imageUrl: 'assets/images/sale/phone.png',
      productCategoryName: 'Vegetables',
      isOnSale: false,
      isPiece: false,
    ),
    ProductModel(
      id: 'Onions',
      title: 'Onions',
      price: 0.59,
      salePrice: 0.28,
      imageUrl: 'assets/images/sale/phone.png',
      productCategoryName: 'Vegetables',
      isOnSale: false,
      isPiece: false,
    ),
    ProductModel(
      id: 'Plantain-flower',
      title: 'Plantain-flower',
      price: 0.99,
      salePrice: 0.389,
      imageUrl: 'assets/images/sale/phone.png',
      productCategoryName: 'Vegetables',
      isOnSale: false,
      isPiece: true,
    ),
    ProductModel(
      id: 'Potato',
      title: 'Potato',
      price: 0.99,
      salePrice: 0.59,
      imageUrl: 'assets/images/sale/phone.png',
      productCategoryName: 'Vegetables',
      isOnSale: true,
      isPiece: false,
    ),
    ProductModel(
      id: 'Radish',
      title: 'Radish',
      price: 0.99,
      salePrice: 0.79,
      imageUrl: 'assets/images/sale/phone.png',
      productCategoryName: 'Vegetables',
      isOnSale: false,
      isPiece: false,
    ),
    ProductModel(
      id: 'Red peppers',
      title: 'Red peppers',
      price: 0.99,
      salePrice: 0.57,
      imageUrl: 'assets/images/sale/phone.png',
      productCategoryName: 'Vegetables',
      isOnSale: false,
      isPiece: false,
    ),
    ProductModel(
      id: 'Squash',
      title: 'Squash',
      price: 3.99,
      salePrice: 2.99,
      imageUrl: 'assets/images/sale/phone.png',
      productCategoryName: 'Vegetables',
      isOnSale: true,
      isPiece: true,
    ),
    ProductModel(
      id: 'Tomatoes',
      title: 'Tomatoes',
      price: 0.99,
      salePrice: 0.39,
      imageUrl: 'assets/images/sale/phone.png',
      productCategoryName: 'Vegetables',
      isOnSale: true,
      isPiece: false,
    ),
    // Grains
    ProductModel(
      id: 'Corn-cobs',
      title: 'Corn-cobs',
      price: 0.29,
      salePrice: 0.19,
      imageUrl: 'assets/images/sale/phone.png',
      productCategoryName: 'Grains',
      isOnSale: false,
      isPiece: true,
    ),
    ProductModel(
      id: 'Peas',
      title: 'Peas',
      price: 0.99,
      salePrice: 0.49,
      imageUrl: 'assets/images/sale/phone.png',
      productCategoryName: 'Grains',
      isOnSale: false,
      isPiece: false,
    ),
    // Herbs
    ProductModel(
      id: 'Asparagus',
      title: 'Asparagus',
      price: 6.99,
      salePrice: 4.99,
      imageUrl: 'assets/images/sale/phone.png',
      productCategoryName: 'Herbs',
      isOnSale: false,
      isPiece: false,
    ),
    ProductModel(
      id: 'Brokoli',
      title: 'Brokoli',
      price: 0.99,
      salePrice: 0.89,
      imageUrl: 'assets/images/sale/phone.png',
      productCategoryName: 'Herbs',
      isOnSale: true,
      isPiece: true,
    ),
    ProductModel(
      id: 'Buk-choy',
      title: 'Buk-choy',
      price: 1.99,
      salePrice: 0.99,
      imageUrl: 'assets/images/sale/phone.png',
      productCategoryName: 'Herbs',
      isOnSale: true,
      isPiece: true,
    ),
    ProductModel(
      id: 'Chinese-cabbage-wombok',
      title: 'Chinese-cabbage-wombok',
      price: 0.99,
      salePrice: 0.5,
      imageUrl: 'assets/images/sale/phone.png',
      productCategoryName: 'Herbs',
      isOnSale: false,
      isPiece: true,
    ),
    ProductModel(
      id: 'Kangkong',
      title: 'Kangkong',
      price: 0.99,
      salePrice: 0.5,
      imageUrl: 'assets/images/sale/phone.png',
      productCategoryName: 'Herbs',
      isOnSale: false,
      isPiece: true,
    ),
    ProductModel(
      id: 'Leek',
      title: 'Leek',
      price: 0.99,
      salePrice: 0.5,
      imageUrl: 'assets/images/sale/phone.png',
      productCategoryName: 'Herbs',
      isOnSale: false,
      isPiece: true,
    ),
    ProductModel(
      id: 'Spinach',
      title: 'Spinach',
      price: 0.89,
      salePrice: 0.59,
      imageUrl: 'assets/images/sale/phone.png',
      productCategoryName: 'Herbs',
      isOnSale: true,
      isPiece: true,
    ),
    ProductModel(
      id: 'Almond',
      title: 'Almond',
      price: 8.99,
      salePrice: 6.5,
      imageUrl: 'assets/images/sale/phone.png',
      productCategoryName: 'Nuts',
      isOnSale: true,
      isPiece: false,
    ),
  ];
}
