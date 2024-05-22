import 'package:api_integration/Model/registration_post_api.dart';
import 'package:api_integration/Service/api_services.dart';
import 'package:flutter/material.dart';

class RegisteredData extends StatefulWidget {
  const RegisteredData({super.key});

  @override
  State<RegisteredData> createState() => _RegisteredDataState();
}

class _RegisteredDataState extends State<RegisteredData> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  RegistrationModel registrationModel = RegistrationModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registered Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'email',
                label: Text('email'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'password',
                label: Text('password'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: double.infinity,
                height: 40,
                child: ElevatedButton(
                    onPressed: () {
                      _registration();
                    }, child: const Text('Registration Form')))
          ],
        ),
      ),
    );
  }
  _registration(){
    ApiService().userRegistration(emailController.text.toString(), passwordController.text.toString()).then((value) {
      setState(() {
        isLoading = false;
        registrationModel = value!;
        print('Token '+registrationModel.token.toString());
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content:const  Text('Registered Successfully'),
          action: SnackBarAction(label:'Token:- '+ registrationModel.token.toString(), onPressed: (){}),
          ),
        );
      });
    }).onError((error, stackTrace) {
      isLoading = false;
      print(error);
    });
  }
}
