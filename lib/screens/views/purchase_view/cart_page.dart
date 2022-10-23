import 'package:flutter/material.dart';
import 'package:marketdo/screens/views/purchase_view/checkout_page.dart';
import 'package:marketdo/widgets/text_widget.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
          StreamBuilder<Object>(
              stream: null,
              builder: (context, snapshot) {
                return ListView.separated(
                    itemCount: 10,
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemBuilder: ((context, index) {
                      return ListTile(
                        trailing: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CheckoutPage()));
                          },
                          child: TextBold(
                              text: 'Checkout',
                              fontSize: 14,
                              color: Colors.green),
                        ),
                        subtitle: TextRegular(
                            text: 'Olana Shop',
                            fontSize: 12,
                            color: Colors.grey),
                        title: TextBold(
                            text: 'Fresh Saging (x2) - 250.00php',
                            fontSize: 18,
                            color: Colors.black),
                        leading: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/images/googlelogo.png',
                            height: 25,
                            width: 25,
                          ),
                        ),
                      );
                    }));
              }),
        ],
      ),
    );
  }
}
