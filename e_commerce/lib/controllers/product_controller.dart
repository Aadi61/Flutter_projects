import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/consts/firebase_consts.dart';
import 'package:e_commerce/models/category_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var subcat = [];

  var quantity = 0.obs;
  var colorIndex = 0.obs;
  var totalPrice = 0.obs;

  var isFav=false.obs; 

  getSubCategories(title) async {
    subcat.clear();
    var jsonString =
        await rootBundle.loadString("lib/services/categories_model.json");
    var decoded = welcomeFromJson(jsonString);
    // print(decoded.categories.toList());
    // print(decoded.categories.toList()[0].subcategory);
    // print("Helloo");
    var s =
        decoded.categories.where((element) => element.name == title).toList();
    //print(s[0].subcategory);
    for (var e in s[0].subcategory) {
      subcat.add(e);
    }
  }

  changeColorIndex(index) {
    colorIndex.value = index;
  }

  increaseQuantity(totalQuantity) {
    if (quantity.value < totalQuantity) {
      quantity.value++;
    }
  }

  decreaseQuantity() {
    if (quantity.value > 0) {
      quantity.value--;
    }
  }

  calculateTotalPrice(price) {
    totalPrice.value = price * quantity.value;
  }

  addToCart({title, img, sellername, color, context}) async {
    await firestore.collection("cart").doc().set({
      'title': title,
      'image': img,
      "quantity": quantity.value,
      'total_price': totalPrice.value,
      'sellername': sellername,
      'added_by': currentUser!.uid,
      'color': color
    }).catchError((onError) {
      VxToast.show(context, msg: onError.toString());
    });
  }

  addToWishlist() async{
    await firestore.collection(productCollection).doc().set({
      'p_wishlist' : FieldValue.arrayUnion([currentUser!.uid])
    },SetOptions(merge: true));
  }
   
  removeFromWhislist() async{
    await firestore.collection(productCollection).doc().set({
      'p_wishlist': FieldValue.arrayRemove([currentUser!.uid])
    },SetOptions(merge: true));
  }
}
