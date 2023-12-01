// import 'package:chat_app/chat_page.dart';
import 'package:chat_app/utils/spaces.dart';
import 'package:chat_app/utils/textfield_styles.dart';
import 'package:chat_app/widgets/login_text_field.dart';
import 'package:flutter/material.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';

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
  final String _url = 'https://isabellaerasmus.co.za';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Chat App",
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
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
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/banner_image.png'),
                      ),
                      borderRadius: BorderRadius.circular(12)),
                ),
                verticleSpacing(24),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      LoginTextField(
                        hintText: 'Enter your username',
                        validator: (value) {
                          if (value != null &&
                              value.isNotEmpty &&
                              value.length < 5) {
                            return 'Your username should be more than 5 characters';
                          } else if (value != null && value.isEmpty) {
                            return "Please type your password";
                          }
                          return null;
                        },
                        controller: userNameController,
                      ),
                      verticleSpacing(24),
                      LoginTextField(
                        hasAsterisks: true,
                        hintText: 'Enter your password',
                        controller: passwordController,
                      ),
                    ],
                  ),
                ),
                verticleSpacing(24),
                ElevatedButton(
                  onPressed: () {
                    loginUser(context);
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                verticleSpacing(24),
                GestureDetector(
                  onTap: () async {
                    if (!await launch(_url)) {
                      throw Exception('Could not launch URL');
                    }
                  },
                  child: Column(
                    children: [
                      Text('Find us on'),
                      Text(_url),
                    ],
                  ),
                ),
                verticleSpacing(24),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaButton.twitter(
                      url: 'https://twitter.com',
                      color: Colors.blue,
                    ),
                    SocialMediaButton.linkedin(
                      url: 'https://linkedin.com',
                      color: Colors.deepPurple,
                    ),
                    SocialMediaButton.instagram(
                      url: 'https://instagram.com',
                      color: Colors.pink,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
