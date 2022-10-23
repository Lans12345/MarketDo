import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:marketdo/screens/views/purchase_view/checkout_page.dart';
import 'package:marketdo/widgets/text_widget.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final box = GetStorage();
  var isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
              TextRegular(text: 'My Cart', fontSize: 18, color: Colors.white),
          backgroundColor: Colors.lightGreen,
          centerTitle: true,
          foregroundColor: Colors.white),
      body: Stack(
        children: [
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Carts')
                  .where('buyerEmail', isEqualTo: box.read('email'))
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return const Center(child: Text('Error'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  print('waiting');
                  return const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Center(
                        child: CircularProgressIndicator(
                      color: Colors.black,
                    )),
                  );
                }

                final data = snapshot.requireData;
                return SizedBox(
                    child: ListView.separated(
                        separatorBuilder: ((context, index) {
                          return const Divider();
                        }),
                        itemCount: snapshot.data?.size ?? 0,
                        itemBuilder: ((context, index) {
                          return ListTile(
                            onLongPress: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: const Text(
                                          'Delete Confirmation',
                                          style: TextStyle(
                                              fontFamily: 'QBold',
                                              fontWeight: FontWeight.bold),
                                        ),
                                        content: const Text(
                                          'Are you sure you want to delete this product into your cart??',
                                          style:
                                              TextStyle(fontFamily: 'QRegular'),
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                            onPressed: () =>
                                                Navigator.of(context).pop(true),
                                            child: const Text(
                                              'Close',
                                              style: TextStyle(
                                                  fontFamily: 'QRegular',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          FlatButton(
                                            onPressed: () {
                                              FirebaseFirestore.instance
                                                  .collection('Carts')
                                                  .doc(data.docs[index].id)
                                                  .delete();
                                              Navigator.of(context).pop(true);
                                            },
                                            child: const Text(
                                              'Continue',
                                              style: TextStyle(
                                                  fontFamily: 'QRegular',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ));
                            },
                            trailing: TextButton(
                              onPressed: () {
                                box.write(
                                    'address', data.docs[index]['address']);
                                box.write(
                                    'category', data.docs[index]['category']);
                                box.write('contactNumber',
                                    data.docs[index]['contactNumber']);
                                box.write('id', data.docs[index]['id']);
                                box.write(
                                    'imageURL', data.docs[index]['imageURL']);
                                box.write('productDescription',
                                    data.docs[index]['productDescription']);

                                box.write('productPrice',
                                    data.docs[index]['productPrice']);
                                box.write('productName',
                                    data.docs[index]['productName']);
                                box.write('seller', data.docs[index]['seller']);
                                box.write('sellerEmail',
                                    data.docs[index]['sellerEmail']);
                                box.write('qty', data.docs[index]['qty']);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CheckoutPage()));
                              },
                              child: TextBold(
                                  text: 'Checkout',
                                  fontSize: 14,
                                  color: Colors.green),
                            ),
                            subtitle: TextRegular(
                                text: 'Seller: ${data.docs[index]['seller']}',
                                fontSize: 12,
                                color: Colors.grey),
                            title: TextBold(
                                text:
                                    '${data.docs[index]['productName']} (x${data.docs[index]['qty']}) - ${data.docs[index]['productPrice']}.00php',
                                fontSize: 18,
                                color: Colors.black),
                            leading: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                data.docs[index]['imageURL'],
                                height: 25,
                                width: 25,
                              ),
                            ),
                          );
                        })));
              }),
        ],
      ),
    );
  }
}
