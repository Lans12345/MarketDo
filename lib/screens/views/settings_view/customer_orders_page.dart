import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:marketdo/widgets/appbar_widget.dart';

import '../../../widgets/text_widget.dart';

class CustomerOrderPage extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarWidget('Customer Orders'),
        body:
            // body: StreamBuilder<QuerySnapshot>(
            //         stream:
            //             FirebaseFirestore.instance.collection('Points').snapshots(),
            //         builder: (BuildContext context,
            //             AsyncSnapshot<QuerySnapshot> snapshot) {
            //           if (snapshot.hasError) {
            //             print('error');
            //             return const Center(child: Text('Error'));
            //           }
            //           if (snapshot.connectionState == ConnectionState.waiting) {
            //             print('waiting');
            //             return const Padding(
            //               padding: EdgeInsets.only(top: 50),
            //               child: Center(
            //                   child: CircularProgressIndicator(
            //                 color: Colors.black,
            //               )),
            //             );
            //           }

            //           final data = snapshot.requireData;
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Purchases')
                    .where('sellerEmail', isEqualTo: box.read('email'))
                    .where('status', isEqualTo: 'To Deliver')
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
                        leading: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(data.docs[index]['imageURL']),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextRegular(
                                text:
                                    '${data.docs[index]['name']} - ${data.docs[index]['buyerAddress']}',
                                fontSize: 14,
                                color: Colors.grey),
                            TextRegular(
                                text: data.docs[index]['buyerContactNumber'],
                                fontSize: 12,
                                color: Colors.grey),
                          ],
                        ),
                        title: TextBold(
                            text: data.docs[index]['productName'] +
                                " x${data.docs[index]['qty']}",
                            fontSize: 18,
                            color: Colors.black),
                        trailing: SizedBox(
                          height: 100,
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                onPressed: () async {
                                  // late int currentPoints;

                                  // late String id = '';
                                  // var collection = FirebaseFirestore.instance
                                  //     .collection('Users')
                                  //     .where('email',
                                  //         isEqualTo: data.docs[index]['email']);

                                  // var querySnapshot = await collection.get();
                                  // if (mounted) {
                                  //   setState(() {
                                  //     for (var queryDocumentSnapshot
                                  //         in querySnapshot.docs) {
                                  //       Map<String, dynamic> data =
                                  //           queryDocumentSnapshot.data();
                                  //       currentPoints = data['points'];
                                  //       id = data['id'];
                                  //     }
                                  //   });
                                  // }

                                  // print(currentPoints.toString() +
                                  //     " Points" +
                                  //     "id" +
                                  //     data.docs[index].id);
                                  // FirebaseFirestore.instance
                                  //     .collection('Users')
                                  //     .doc(id)
                                  //     .update({
                                  //   'points': currentPoints + 100,
                                  // });

                                  // FirebaseFirestore.instance
                                  //     .collection('Points')
                                  //     .doc(data.docs[index].id)
                                  //     .delete();

                                  FirebaseFirestore.instance
                                      .collection('Purchases')
                                      .doc(data.docs[index]['id'])
                                      .update({
                                    'status': 'To Pay',
                                  });
                                },
                                icon: const Icon(
                                  Icons.check_box_outlined,
                                  color: Colors.blue,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection('Purchases')
                                      .doc(data.docs[index].id)
                                      .delete();
                                },
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ));
                })
        // }),

        );
  }
}
