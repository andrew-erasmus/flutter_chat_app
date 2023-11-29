// import 'package:chat_app/chat_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formkey = GlobalKey<FormState>();
  void loginUser(context) {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      print(userNameController.text);
      print(passwordController.text);
      print('login successful!');

      Navigator.pushReplacementNamed(context, '/chat',
          arguments: '${userNameController.text}');
    } else {
      print('login not successful!');
    }
  }

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Chat App",
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Let's sign you in!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5),
                ),
                const Text(
                  "Welcome back! \n You've been missed!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.blueGrey),
                ),
                // Image.network(""),

                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value != null &&
                              value.isNotEmpty &&
                              value.length < 5) {
                            return 'Your username should be more than 5 characters';
                          } else if (value != null && value.isEmpty) {
                            return "Please type your username";
                          }
                          return null;
                        },
                        controller: userNameController,
                        decoration: const InputDecoration(
                          hintText: 'Add your username',
                          hintStyle: TextStyle(color: Colors.blueGrey),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Type your password',
                          hintStyle: TextStyle(color: Colors.blueGrey),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      loginUser(context);
                    },
                    child: const Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    )),

                InkWell(
                  splashColor: Colors.purple,
                  onTap: () {
                    //TODO: Navigate to browser
                    print('link clicked');
                  },
                  child: const Column(
                    children: [
                      Text('Find us on'),
                      Text('https://isabellaerasmus.co.za'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
