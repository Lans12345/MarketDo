import 'package:flutter/material.dart';
import 'package:marketdo/screens/views/settings_view/post_product.dart';
import 'package:marketdo/widgets/appbar_widget.dart';
import 'package:marketdo/widgets/button_widget.dart';
import 'package:marketdo/widgets/text_widget.dart';

class SellProducts extends StatefulWidget {
  const SellProducts({Key? key}) : super(key: key);

  @override
  State<SellProducts> createState() => _SellProductsState();
}

class _SellProductsState extends State<SellProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget('My Products'),
      body: Stack(
        children: [
          ListView.separated(
            itemCount: 20,
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemBuilder: ((context, index) {
              return ListTile(
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/googlelogo.png'),
                ),
                title: TextBold(
                  text: 'Fresh Saging',
                  fontSize: 18,
                  color: Colors.grey,
                ),
                subtitle: TextRegular(
                  text: 'Posted on 10/10/2022',
                  fontSize: 12,
                  color: Colors.grey,
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ButtonWidget(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => PostProduct()));
                  },
                  text: 'Add Product'),
            ),
          ),
        ],
      ),
    );
  }
}
