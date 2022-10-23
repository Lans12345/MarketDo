import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:marketdo/screens/views/purchase_view/checkout_page.dart';
import 'package:marketdo/services/cloud_function/add_cart.dart';
import 'package:marketdo/widgets/text_widget.dart';

class ViewProductPage extends StatefulWidget {
  @override
  State<ViewProductPage> createState() => _ViewProductPageState();
}

class _ViewProductPageState extends State<ViewProductPage> {
  final box = GetStorage();

  int qty = 0;

  @override
  void initState() {
    super.initState();
    getData();
  }

  late String name = '';
  late String contactNumber = '';
  late String email = '';
  late String address = '';

  getData() async {
    // Use provider
    var collection = FirebaseFirestore.instance
        .collection('Users')
        .where('email', isEqualTo: box.read('email'));

    var querySnapshot = await collection.get();
    if (mounted) {
      setState(() {
        for (var queryDocumentSnapshot in querySnapshot.docs) {
          Map<String, dynamic> data = queryDocumentSnapshot.data();

          name = data['name'];
          contactNumber = data['phoneNumber'];
          email = data['email'];
          address = data['address'];
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue[400],
        title: TextBold(
            text: 'Viewing Product', fontSize: 18, color: Colors.white),
      ),
      body: Center(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Image.network(
                  box.read('imageURL'),
                  height: 180,
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  trailing: TextBold(
                      text: box.read('productPrice'),
                      fontSize: 24,
                      color: Colors.blue),
                  title: TextBold(
                      text: box.read('productName'),
                      fontSize: 24,
                      color: Colors.black),
                ),
                TextRegular(
                    text: 'Product Description',
                    fontSize: 12,
                    color: Colors.grey),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextRegular(
                      text: box.read('productDescription'),
                      fontSize: 12,
                      color: Colors.black),
                ),
                TextRegular(
                    text: 'Seller: ' + box.read('seller'),
                    fontSize: 12,
                    color: Colors.grey),
                ListTile(
                  title: TextBold(
                      text: box.read('contactNumber'),
                      fontSize: 18,
                      color: Colors.black),
                  subtitle: TextRegular(
                      text: 'Contact Number', fontSize: 12, color: Colors.grey),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                ),
                ListTile(
                  title: TextBold(
                      text: box.read('address'),
                      fontSize: 18,
                      color: Colors.black),
                  subtitle: TextRegular(
                      text: 'Seller Address', fontSize: 12, color: Colors.grey),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                ),
                TextRegular(
                    text: 'Product Quantity', fontSize: 12, color: Colors.grey),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        print(qty);
                        setState(() {
                          if (qty == 0) {
                          } else {
                            qty--;
                          }
                        });
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    TextRegular(
                        text: qty.toString(),
                        fontSize: 18,
                        color: Colors.black),
                    IconButton(
                      onPressed: () {
                        print(qty);
                        setState(() {
                          qty++;
                        });
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                    color: Colors.green,
                    onPressed: () {
                      addCart(
                          name,
                          email,
                          box.read('seller'),
                          box.read('sellerEmail'),
                          box.read('contactNumber'),
                          box.read('address'),
                          box.read('category'),
                          box.read('productName'),
                          box.read('productDescription'),
                          box.read('imageURL'),
                          box.read('productPrice'),
                          qty);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Product added to cart'),
                        ),
                      );
                    },
                    child: TextBold(
                        text: 'Add to Cart', fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  FlatButton(
                    color: Colors.blue,
                    onPressed: () {
                      box.write('qty', qty);

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CheckoutPage()));
                    },
                    child: TextBold(
                        text: 'Buy Now', fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
