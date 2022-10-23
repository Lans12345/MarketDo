import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:marketdo/screens/product_category.dart';
import 'package:marketdo/screens/view_product_page.dart';
import '../../widgets/search_bar_widget.dart';
import '../../widgets/text_widget.dart';

class HomeProduct extends StatefulWidget {
  @override
  State<HomeProduct> createState() => _HomeProductState();
}

class _HomeProductState extends State<HomeProduct> {
  final box = GetStorage();

  late String profilePicture = '';

  @override
  void initState() {
    super.initState();
    getData();
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

          profilePicture = data['profilePicture'];
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        color: Colors.lightBlue[200],
        width: double.infinity,
        height: 150,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      minRadius: 20,
                      maxRadius: 20,
                      backgroundImage:
                          AssetImage('assets/images/googlelogo.png'),
                    ),
                  ),
                  CircleAvatar(
                    minRadius: 25,
                    maxRadius: 25,
                    backgroundImage: NetworkImage(profilePicture),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  showSearch(
                    context: context,
                    delegate: MySearchDelegate(),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      width: 300,
                      height: 55,
                      child: Center(
                        child: ListTile(
                          title: TextBold(
                              text: 'Search Shop',
                              fontSize: 14,
                              color: Colors.grey),
                          trailing: const Icon(Icons.search),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: TextBold(text: 'Categories', fontSize: 24, color: Colors.black),
      ),
      const SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              GestureDetector(
                onTap: () {
                  box.write('categ', 'Snacks');
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductCategory()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    color: Colors.lightBlue[200],
                    height: 100,
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network(
                          'https://cdn-icons-png.flaticon.com/512/2553/2553651.png',
                          color: Colors.white,
                          height: 50,
                        ),
                        TextBold(
                            text: 'Snacks', fontSize: 14, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  box.write('categ', 'Meals');
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductCategory()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    color: Colors.lightBlue[200],
                    height: 100,
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network(
                          'https://cdn-icons-png.flaticon.com/512/2918/2918130.png',
                          color: Colors.white,
                          height: 50,
                        ),
                        TextBold(
                            text: 'Meals', fontSize: 14, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  box.write('categ', 'Vegetables');
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductCategory()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    color: Colors.lightBlue[200],
                    height: 100,
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network(
                          'https://cdn-icons-png.flaticon.com/512/2329/2329903.png',
                          color: Colors.white,
                          height: 50,
                        ),
                        TextBold(
                            text: 'Vegetables',
                            fontSize: 14,
                            color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  box.write('categ', 'Fruits');
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductCategory()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    color: Colors.lightBlue[200],
                    height: 100,
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.network(
                          'https://cdn-icons-png.flaticon.com/512/3081/3081887.png',
                          color: Colors.white,
                          height: 50,
                        ),
                        TextBold(
                            text: 'Fruits', fontSize: 14, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child:
            TextBold(text: 'Daily Discover', fontSize: 24, color: Colors.black),
      ),
      const SizedBox(
        height: 10,
      ),
      Expanded(
        child: SizedBox(
          child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('Products').snapshots(),
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
                return GridView.builder(
                    itemCount: snapshot.data?.size ?? 0,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          box.write('address', data.docs[index]['address']);
                          box.write('category', data.docs[index]['category']);
                          box.write('contactNumber',
                              data.docs[index]['contactNumber']);
                          box.write('id', data.docs[index]['id']);
                          box.write('imageURL', data.docs[index]['imageURL']);
                          box.write('productDescription',
                              data.docs[index]['productDescription']);

                          box.write(
                              'productPrice', data.docs[index]['productPrice']);
                          box.write(
                              'productName', data.docs[index]['productName']);
                          box.write('seller', data.docs[index]['seller']);
                          box.write(
                              'sellerEmail', data.docs[index]['sellerEmail']);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ViewProductPage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              Container(
                                color: Colors.lightBlue[200],
                                height: 120,
                                width: 170,
                                child: Image.network(
                                  data.docs[index]['imageURL'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                height: 50,
                                width: 170,
                                child: ListTile(
                                  trailing: TextBold(
                                      text: data.docs[index]['productPrice'],
                                      fontSize: 18,
                                      color: Colors.blue),
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextBold(
                                          text: data.docs[index]['productName'],
                                          fontSize: 14,
                                          color: Colors.black),
                                      TextRegular(
                                          text: data.docs[index]['address'],
                                          fontSize: 10,
                                          color: Colors.grey),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }),
        ),
      ),
    ]);
  }
}
