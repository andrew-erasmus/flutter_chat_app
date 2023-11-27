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
        body: Text("Let's sign you in!"),
      ),
    );
  }
}
