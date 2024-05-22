import 'package:api_integration/Home/home_screen.dart';
import 'package:api_integration/Model/login_response_model.dart';
import 'package:api_integration/Service/api_services.dart';
import 'package:flutter/material.dart';

class FirstPostApi extends StatefulWidget {
  const FirstPostApi({super.key});

  @override
  State<FirstPostApi> createState() => _FirstPostApiState();
}

class _FirstPostApiState extends State<FirstPostApi> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginResponseModel loginResponseModel = LoginResponseModel();
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
                    _login();
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

  _login() {
    ApiService()
        .userLogin(
            emailController.text.toString(), passwordController.text.toString())
        .then((value) {
      setState(() {
        isLoading = false;
        loginResponseModel = value!;
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    HomeScreen(token: loginResponseModel.token.toString())));
      });
    }).onError((error, stackTrace) {
      isLoading = false;
      print(error);
    });
  }
}
