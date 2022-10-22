import 'package:cloud_firestore/cloud_firestore.dart';

Future addHistory(
  String buyerEmail,
  String seller,
  String sellerAddress,
  String sellerContactNumber,
  String productName,
  String imageURL,
  String productPrice,
) async {
  final docUser = FirebaseFirestore.instance.collection('History').doc();

  final json = {
    'buyerEmail': buyerEmail,
    'seller': seller,
    'sellerAddress': sellerAddress,
    'sellerContactNumber': sellerContactNumber,
    "productName": productName,
    'productPrice': productPrice,
    'imageURL': imageURL,
    'id': docUser.id,
  };

  await docUser.set(json);
}
