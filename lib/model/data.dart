

import 'package:skitestore/model/AdvertSliderModel.dart';
import 'package:skitestore/model/CategoryModel.dart';
import 'package:skitestore/model/ProductModel.dart';
import 'package:skitestore/styles/AppImage.dart';


//************ SLIDER IMAGE DATA */
List<AdvertSliderModel> advert(){
List<AdvertSliderModel> advertSliderList =  [
AdvertSliderModel(image: 'https://testappplatform.000webhostapp.com/productimages/food4.jpeg',title: 'Number 1'),
AdvertSliderModel(image: 'https://testappplatform.000webhostapp.com/productimages/d.jpg', title: 'Number 1'),
AdvertSliderModel(image: 'https://testappplatform.000webhostapp.com/productimages/food4.jpeg', title: 'Number 1'),
];
return advertSliderList;
}

//********* CATEGORY DATA */
List<CategoryModel> category(){
List<CategoryModel> categoryList =  [
CategoryModel(iconLink: 'https://www.svgrepo.com/download/7830/sweater.svg', name: 'Wears'),
CategoryModel(iconLink: 'https://www.svgrepo.com/download/3999/computer.svg', name: 'Laptops'),
CategoryModel(iconLink: 'https://www.svgrepo.com/download/9049/wristwatch.svg', name: 'Watch'),
CategoryModel(iconLink: 'https://www.svgrepo.com/download/1935/women-long-coat.svg', name: 'Women'),
CategoryModel(iconLink: 'https://www.svgrepo.com/download/288102/air-conditioning-air-conditioner.svg', name: 'Air condition'),
// CategoryModel(iconLink: '', name: ''),
// CategoryModel(iconLink: '', name: ''),
// CategoryModel(iconLink: '', name: ''),
// CategoryModel(iconLink: '', name: ''),
// CategoryModel(iconLink: '', name: ''),

];

return categoryList;
}

//********* Latest Produst */
List<ProductModel> latestProduct(){
List<ProductModel> lProductsList =  [
ProductModel(image: AppImage.watch1, name: 'Watch 1', desc: 'This is a watch made from Nigerian, 9ice watch Ever', like: true, status: true, price: 'N10,000', rate: '4.0'),
ProductModel(image: AppImage.splash1, name: 'App', desc: 'This is a worldwide E-commerce App for all Shops', like: true, status: true, price: 'N10,000', rate: '4.0'),
ProductModel(image: AppImage.watch2, name: 'Watch 2', desc: 'This is a watch made from Nigerian, 9ice watch Ever', like: false, status: true, price: 'N5,000', rate: '1.0'),
ProductModel(image: AppImage.watch3, name: 'Watch 3', desc: 'This is a watch made from Nigerian, 9ice watch Ever', like: true, status: false, price: 'N100,000', rate: '5.0'),
ProductModel(image: AppImage.watch4, name: 'Watch 4', desc: 'This is a watch made from Nigerian, 9ice watch Ever', like: false, status: true, price: 'N190,000', rate: '3.0'),
ProductModel(image: AppImage.watch5, name: 'Watch 5', desc: 'This is a watch made from Nigerian, 9ice watch Ever', like: true, status: true, price: 'N9,000', rate: '2.0'),
ProductModel(image: AppImage.watch6, name: 'Watch 6', desc: 'This is a watch made from Nigerian, 9ice watch Ever', like: false, status: false, price: 'N105,000', rate: '3.0'),
ProductModel(image: AppImage.watch7, name: 'Watch 7', desc: 'This is a watch made from Nigerian, 9ice watch Ever', like: true, status: true, price: 'N18,000', rate: '2.0'),
ProductModel(image: AppImage.watch8, name: 'Watch 8', desc: 'This is a watch made from Nigerian, 9ice watch Ever', like: true, status: false, price: 'N17,000', rate: '5.0'),

];

return lProductsList;
}

//********* CartList Produst */
List<ProductModel> cartList(){
List<ProductModel> lProductsList =  [
ProductModel(image: AppImage.shoe1, name: 'Watch 1', desc: 'This is a watch made from Nigerian, 9ice watch Ever', like: true, status: true, price: 'N10,000', rate: '4.0'),
ProductModel(image: AppImage.splash1, name: 'App', desc: 'This is a worldwide E-commerce App for all Shops', like: true, status: true, price: 'N10,000', rate: '4.0'),
ProductModel(image: AppImage.watch2, name: 'Watch 2', desc: 'This is a watch made from Nigerian, 9ice watch Ever', like: false, status: true, price: 'N5,000', rate: '1.0'),

];

return lProductsList;
}