import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Chat App",
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Scaffold(
          appBar: AppBar(),
          drawer: Drawer(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              print("Button clicked");
            },
          ),
          body: const Column(
            children: [
              Text(
                "Let's sign you in!",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5),
              ),
              Text(
                "Welcome back! \n You've been missed!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.blueGrey),
              ),
            ],
          )),
    );
  }
}
