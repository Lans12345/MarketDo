import 'package:flutter/material.dart';
import 'package:marketdo/widgets/appbar_widget.dart';

import '../../../widgets/text_widget.dart';

class CustomerOrderPage extends StatelessWidget {
  const CustomerOrderPage({Key? key}) : super(key: key);

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
            ListView.separated(
          // itemCount: snapshot.data?.size ?? 0,
          itemCount: 10,
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemBuilder: ((context, index) {
            return ListTile(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/googlelogo.png'),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextRegular(
                      text: 'Lance Olana - Impasugong Bukidnon',
                      fontSize: 14,
                      color: Colors.grey),
                  TextRegular(
                      text: '09090104355', fontSize: 12, color: Colors.grey),
                ],
              ),
              title: TextBold(
                  text: 'Fresh Saging', fontSize: 18, color: Colors.black),
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
                      },
                      icon: const Icon(
                        Icons.check_box_outlined,
                        color: Colors.blue,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // FirebaseFirestore.instance
                        //     .collection('Points')
                        //     .doc(data.docs[index].id)
                        //     .delete();
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
        )
        // }),

        );
  }
}
