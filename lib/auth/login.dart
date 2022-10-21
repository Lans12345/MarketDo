import 'package:flutter/material.dart';
import 'package:marketdo/auth/signup.dart';
import 'package:marketdo/screens/home_page.dart';
import 'package:marketdo/widgets/button_widget.dart';
import 'package:marketdo/widgets/text_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              Image.asset(
                'assets/images/googlelogo.png',
                height: 150,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextFormField(
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'QRegular'),
                  onChanged: (_userName) {},
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelText: 'User name',
                    labelStyle: const TextStyle(
                      fontFamily: 'Quicksand',
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 35),
                child: TextFormField(
                  obscureText: true,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'QRegular'),
                  onChanged: (_userName) {},
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                      fontFamily: 'Quicksand',
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              ButtonWidget(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const HomePage()));
                  },
                  text: 'Login'),
              const SizedBox(
                height: 10,
              ),
              TextRegular(text: 'or', fontSize: 14, color: Colors.grey),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 70, right: 70, top: 0, bottom: 20),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: Colors.lightGreen,
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/googlelogo.png',
                          height: 25,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'Login with Google',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white,
                              fontFamily: 'QRegular'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextRegular(
                      text: 'No Account?', fontSize: 12, color: Colors.grey),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignupPage()));
                    },
                    child: TextBold(
                        text: 'Create now', fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
