import 'package:api_integration/Service/api_services.dart';
import 'package:api_integration/Model/single_post_model.dart';
import 'package:flutter/material.dart';

class FirstApiGet extends StatefulWidget {
  const FirstApiGet({super.key});

  @override
  State<FirstApiGet> createState() => _FirstApiGetState();
}

class _FirstApiGetState extends State<FirstApiGet> {
  bool isLoading = false;
  SinglePostWithmodel singlePostWithmodel = SinglePostWithmodel();
  _getSinglePost() {
    isLoading = true;
    ApiService().getSinglePostWithModel().then((value) {
      setState(() {
        singlePostWithmodel = value!;
        isLoading = false;
      });
    }).onError((error, stackTrace) {
      print(error);
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _getSinglePost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('First Get Api'),
        ),
        body: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Text(
                    singlePostWithmodel.userId.toString(),
                    style: const TextStyle(fontSize: 25, color: Colors.red),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    singlePostWithmodel.title.toString(),
                    style: const TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    singlePostWithmodel.body.toString(),
                    style: const TextStyle(
                        fontSize: 15, color: Colors.black),
                  ),
                ],
              ));
  }
}
