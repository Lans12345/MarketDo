import 'package:flutter/material.dart';
import 'package:marketdo/screens/home_page.dart';
import 'package:marketdo/widgets/text_widget.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

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
                  Image.asset(
                    'assets/images/googlelogo.png',
                    height: 120,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextBold(
                        text: 'Fresh Saging',
                        fontSize: 24,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextRegular(
                        text: 'Quantity: 2pcs',
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextRegular(
                        text: 'Price per qty: 50.00php',
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
                  text: 'Lance Olana',
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
                  text: 'Impasugong Bukidnon',
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
                  text: '09090104355',
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
                    text: '250.00php', fontSize: 24, color: Colors.grey),
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
