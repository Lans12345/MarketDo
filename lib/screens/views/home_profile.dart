import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:marketdo/screens/views/purchase_view/cart_page.dart';
import 'package:marketdo/widgets/text_widget.dart';

class HomeProfile extends StatefulWidget {
  @override
  State<HomeProfile> createState() => _HomeProfileState();
}

class _HomeProfileState extends State<HomeProfile> {
  bool _selected2 = false;
  bool _selected1 = true;

  late int chipValue = 0;

  @override
  void initState() {
    super.initState();
    getData();
  }

  final box = GetStorage();

  late String profilePicture = '';
  late String name = '';
  late String contactNumber = '';

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

          profilePicture = data['profilePicture'];
          name = data['name'];
          contactNumber = data['phoneNumber'];
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.lightBlue[200],
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.lightGreen[400],
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                      ),
                    ),
                    width: double.infinity,
                    height: 100,
                    child: Center(
                      child: ListTile(
                        leading: GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            minRadius: 30,
                            maxRadius: 30,
                            backgroundImage: NetworkImage(profilePicture),
                          ),
                        ),
                        title: TextBold(
                            text: name, fontSize: 24, color: Colors.white),
                        subtitle: TextRegular(
                            text: contactNumber,
                            fontSize: 10,
                            color: Colors.white),
                        trailing: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CartPage()));
                          },
                          icon: const Icon(
                            Icons.shopping_cart_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const Icon(Icons.list_alt_rounded),
              title: TextBold(
                  text: 'My Purchase', fontSize: 15, color: Colors.black),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: ChoiceChip(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      avatar: const Icon(
                        Icons.account_balance_wallet_rounded,
                        color: Colors.white,
                      ),
                      onSelected: (value) {
                        setState(() {
                          _selected1 = value;
                          chipValue = 0;
                          _selected2 = false;
                        });
                      },
                      selectedColor: Colors.green,
                      disabledColor: Colors.grey,
                      backgroundColor: Colors.grey,
                      label: TextRegular(
                          text: 'To Pay', fontSize: 12, color: Colors.white),
                      selected: _selected1),
                ),
                const SizedBox(
                  width: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: ChoiceChip(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      avatar: const Icon(
                        Icons.payment,
                        color: Colors.white,
                      ),
                      onSelected: (value) {
                        setState(() {
                          _selected2 = value;
                          chipValue = 1;
                          _selected1 = false;
                        });
                      },
                      selectedColor: Colors.green,
                      disabledColor: Colors.grey,
                      backgroundColor: Colors.grey,
                      label: TextRegular(
                          text: 'To Receive',
                          fontSize: 12,
                          color: Colors.white),
                      selected: _selected2),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SizedBox(
                child: IndexedStack(
                  index: chipValue,
                  children: [
                    StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('Purchases')
                            .where('buyerEmail', isEqualTo: box.read('email'))
                            .where('status', isEqualTo: 'To Deliver')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            print(snapshot.error);
                            return const Center(child: Text('Error'));
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
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
                                  title: TextBold(
                                      text: data.docs[index]['productName'],
                                      fontSize: 16,
                                      color: Colors.black),
                                  trailing: TextBold(
                                      text: data.docs[index]['productPrice'],
                                      fontSize: 18,
                                      color: Colors.green),
                                  leading: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.network(
                                        data.docs[index]['imageURL']),
                                  ),
                                );
                              }),
                            ),
                          );
                        }),
                    StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('Purchases')
                            .where('buyerEmail', isEqualTo: box.read('email'))
                            .where('status', isEqualTo: 'To Pay')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            print(snapshot.error);
                            return const Center(child: Text('Error'));
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
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
                                  title: TextBold(
                                      text: data.docs[index]['productName'],
                                      fontSize: 16,
                                      color: Colors.black),
                                  trailing: SizedBox(
                                    width: 110,
                                    child: Row(
                                      children: [
                                        TextBold(
                                            text: data.docs[index]
                                                ['productPrice'],
                                            fontSize: 18,
                                            color: Colors.green),
                                        IconButton(
                                          onPressed: () {
                                            FirebaseFirestore.instance
                                                .collection('Purchases')
                                                .doc(data.docs[index]['id'])
                                                .update({
                                              'status': 'History',
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.done_outline_rounded,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  leading: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.network(
                                        data.docs[index]['imageURL']),
                                  ),
                                );
                              }),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
