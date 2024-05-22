import 'package:flutter/material.dart';

import '../Home/home_screen.dart';
import '../Service/api_services.dart';

class SecondWithoutModelPost extends StatefulWidget {
  const SecondWithoutModelPost({super.key});

  @override
  State<SecondWithoutModelPost> createState() => _SecondWithoutModelPostState();
}

class _SecondWithoutModelPostState extends State<SecondWithoutModelPost> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Post Data'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                  hintText: 'Enter Your Email Address',
                  label: Text('Enter Your Email Address')),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                  hintText: 'Enter Your Password',
                  label: Text('Enter Your Password')),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                    });
                    _loginUser();
                  },
                  child: isLoading == true
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const Text('Login')),
            ),
          ],
        ),
      ),
    );
  }

  _loginUser() {
    ApiService()
        .userWithoutModelLogin(
            emailController.text.toString(), passwordController.text.toString())
        .then((value) {
      setState(() {
        isLoading = false;
        print(value["token"]);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    HomeScreen(token: value["token"].toString())));
      });
    }).onError((error, stackTrace) {
      isLoading = false;
      print(error);
    });
  }
}
