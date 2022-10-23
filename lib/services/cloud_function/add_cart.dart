import 'package:cloud_firestore/cloud_firestore.dart';

Future addCart(
    String name,
    String buyerEmail,
    String seller,
    String sellerEmail,
    String contactNumber,
    String address,
    String category,
    String productName,
    String productDescription,
    String imageURL,
    String productPrice,
    int qty) async {
  final docUser = FirebaseFirestore.instance.collection('Carts').doc();

  final json = {
    'name': name,
    'buyerEmail': buyerEmail,
    'seller': seller,
    'sellerEmail': sellerEmail,
    'contactNumber': contactNumber,
    'address': address,
    'category': category,
    "productName": productName,
    'productDescription': productDescription,
    'productPrice': productPrice,
    'imageURL': imageURL,
    'id': docUser.id,
    'qty': qty,
  };

  await docUser.set(json);
}
