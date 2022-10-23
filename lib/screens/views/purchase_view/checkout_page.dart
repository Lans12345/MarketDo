import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:marketdo/screens/home_page.dart';
import 'package:marketdo/widgets/text_widget.dart';

import '../../../services/cloud_function/buy_product.dart';

class CheckoutPage extends StatefulWidget {
  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final box = GetStorage();
  @override
  void initState() {
    super.initState();
    getData();
  }

  late String name = '';

  late String contactNumber = '';

  late String email = '';

  late String address = '';

  getTotal() {
    var total = int.parse(box.read('productPrice')) * box.read('qty');
    return total;
  }

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
        foregroundColor: Colors.white,
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
        title: TextRegular(
            text: 'Checkout Confirmation', fontSize: 18, color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Image.network(
                    box.read('imageURL'),
                    height: 120,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextBold(
                        text: box.read('productName'),
                        fontSize: 24,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextRegular(
                        text: 'Quantity: ${box.read('qty').toString()}pcs',
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextRegular(
                        text:
                            'Price per qty: ${box.read('productPrice')}.00php',
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              TextBold(
                text: 'Seller Information',
                fontSize: 18,
                color: Colors.black,
              ),
              ListTile(
                trailing: const Icon(Icons.person),
                title: TextBold(
                  text: box.read('seller'),
                  fontSize: 18,
                  color: Colors.grey,
                ),
                subtitle: TextRegular(
                  text: 'Seller name',
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              ListTile(
                trailing: const Icon(Icons.location_on_rounded),
                title: TextBold(
                  text: box.read('address'),
                  fontSize: 18,
                  color: Colors.grey,
                ),
                subtitle: TextRegular(
                  text: 'Seller address',
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              ListTile(
                trailing: const Icon(Icons.phone),
                title: TextBold(
                  text: box.read('contactNumber'),
                  fontSize: 18,
                  color: Colors.grey,
                ),
                subtitle: TextRegular(
                  text: 'Seller contact number',
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                trailing: TextBold(
                  text: 'Cash On Delivery',
                  fontSize: 18,
                  color: Colors.green,
                ),
                leading: TextRegular(
                  text: 'Mode of Payment',
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const Divider(),
              ListTile(
                leading:
                    TextBold(text: 'Total', fontSize: 16, color: Colors.grey),
                title: TextBold(
                    text: '${getTotal()}.00php',
                    fontSize: 24,
                    color: Colors.grey),
                trailing: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  color: Colors.green,
                  child: TextRegular(
                      text: 'Confirm', fontSize: 14, color: Colors.white),
                  onPressed: () {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text(
                                'Success!',
                                style: TextStyle(
                                    fontFamily: 'QBold',
                                    fontWeight: FontWeight.bold),
                              ),
                              content: const Text(
                                'Thankyou for your purchase',
                                style: TextStyle(fontFamily: 'QRegular'),
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    buyProduct(
                                        name,
                                        email,
                                        address,
                                        contactNumber,
                                        box.read('seller'),
                                        box.read('sellerEmail'),
                                        box.read('contactNumber'),
                                        box.read('address'),
                                        box.read('category'),
                                        box.read('productName'),
                                        box.read('productDescription'),
                                        box.read('imageURL'),
                                        getTotal().toString(),
                                        box.read('qty'));
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomePage()));
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
