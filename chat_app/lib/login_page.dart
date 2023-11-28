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
          body: Column(
            children: [
              const Text(
                "Let's sign you in!",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5),
              ),
              const Text(
                "Welcome back! \n You've been missed!",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.blueGrey),
              ),
              // Image.network(""),
              Container(
                height: 150,
                width: 150,
                child: FlutterLogo(),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(50),
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("")),
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(24),
                ),
              )
            ],
          )),
    );
  }
}
