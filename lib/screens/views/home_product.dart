import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:marketdo/screens/product_category.dart';
import 'package:marketdo/screens/view_product_page.dart';
import '../../widgets/text_widget.dart';

class HomeProduct extends StatelessWidget {
  final box = GetStorage();

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
                children: const [
                  Padding(
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
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    width: 300,
                    height: 40,
                    child: TextFormField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 0),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 0),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'Search Shop'),
                    ),
                  ),
                ],
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
                        Image.asset(
                          'assets/images/googlelogo.png',
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
                        Image.asset(
                          'assets/images/googlelogo.png',
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
                        Image.asset(
                          'assets/images/googlelogo.png',
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
                        Image.asset(
                          'assets/images/googlelogo.png',
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
          child: StreamBuilder<Object>(
              stream: null,
              builder: (context, snapshot) {
                return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ViewProductPage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              Container(
                                color: Colors.lightBlue[200],
                                height: 120,
                                width: 170,
                                child: Image.asset(
                                  'assets/images/googlelogo.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                color: Colors.white,
                                height: 50,
                                width: 170,
                                child: ListTile(
                                  trailing: TextBold(
                                      text: '250php',
                                      fontSize: 18,
                                      color: Colors.blue),
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextBold(
                                          text: 'Saging',
                                          fontSize: 14,
                                          color: Colors.black),
                                      TextRegular(
                                          text: 'Impasugong Bukidnon',
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
