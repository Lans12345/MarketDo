import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
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
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget('My Products'),
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Products')
                  .where('sellerEmail', isEqualTo: box.read('email'))
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
                return Expanded(
                  child: SizedBox(
                    child: ListView.builder(
                      itemCount: snapshot.data?.size ?? 0,
                      itemBuilder: ((context, index) {
                        return ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(data.docs[index]['imageURL']),
                          ),
                          title: TextBold(
                            text: data.docs[index]['productName'],
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection('Products')
                                  .doc(data.docs[index].id)
                                  .delete();
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                );
              }),
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
