import 'package:flutter/material.dart';
import 'package:marketdo/widgets/button_widget.dart';
import 'package:marketdo/widgets/text_widget.dart';

class ViewProductPage extends StatelessWidget {
  const ViewProductPage({Key? key}) : super(key: key);

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
                Image.asset(
                  'assets/images/googlelogo.png',
                  height: 180,
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  trailing: TextBold(
                      text: '250php', fontSize: 24, color: Colors.blue),
                  title: TextBold(
                      text: 'Fresh Saging', fontSize: 24, color: Colors.black),
                ),
                TextRegular(
                    text: 'Product Description',
                    fontSize: 12,
                    color: Colors.grey),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextRegular(
                      text:
                          'Lipsum Opsum Lipsum Opsum Lipsum Opsum Lipsum Opsum Lipsum Opsum Lipsum Opsum Lipsum Opsum Lipsum Opsum Lipsum Opsum Lipsum Opsum',
                      fontSize: 12,
                      color: Colors.black),
                ),
                TextRegular(
                    text: 'Shop: Gaisano Mall',
                    fontSize: 12,
                    color: Colors.grey),
                ListTile(
                  title: TextBold(
                      text: '09090104355', fontSize: 18, color: Colors.black),
                  subtitle: TextRegular(
                      text: 'Contact Number', fontSize: 12, color: Colors.grey),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                ),
                ListTile(
                  title: TextBold(
                      text: 'Impasugong Bukidnon',
                      fontSize: 18,
                      color: Colors.black),
                  subtitle: TextRegular(
                      text: 'Shop Address', fontSize: 12, color: Colors.grey),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
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
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: 180,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                TextBold(
                                    text: 'Product Quantity',
                                    fontSize: 18,
                                    color: Colors.black),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.remove),
                                    ),
                                    TextRegular(
                                        text: '0',
                                        fontSize: 18,
                                        color: Colors.black),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.add),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ButtonWidget(
                                    onPressed: () {}, text: 'Continue'),
                              ],
                            ),
                          );
                        },
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
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: 180,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                TextBold(
                                    text: 'Product Quantity',
                                    fontSize: 18,
                                    color: Colors.black),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.remove),
                                    ),
                                    TextRegular(
                                        text: '0',
                                        fontSize: 18,
                                        color: Colors.black),
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.add),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ButtonWidget(
                                    onPressed: () {}, text: 'Continue'),
                              ],
                            ),
                          );
                        },
                      );
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
