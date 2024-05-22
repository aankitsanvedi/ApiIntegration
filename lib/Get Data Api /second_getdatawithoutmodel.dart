import 'package:api_integration/Service/api_services.dart';
import 'package:flutter/material.dart';

class SecondWithoutModel extends StatefulWidget {
  const SecondWithoutModel({super.key});

  @override
  State<SecondWithoutModel> createState() => _SecondWithoutModelState();
}

class _SecondWithoutModelState extends State<SecondWithoutModel> {
  bool isLoading = false;
  dynamic singlePost;
  _getDataWithoutModel() {
    isLoading = true;
    ApiService().getSinglePostWithOutModel().then((value) {
      setState(() {
        singlePost = value;
        isLoading = false;
      });
    }).onError((error, stackTrace) {
      print(error);
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _getDataWithoutModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Without Model'),
      ),
      body: isLoading == true?
          const Center(
            child: CircularProgressIndicator(),
          ): 
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(singlePost["userId"].toString(), style: TextStyle(fontSize: 27, color: Colors.purple),),
                const SizedBox(height: 20,),
                Text(singlePost["title"].toString(), style: TextStyle(fontSize: 20, color: Colors.cyan),),
                const SizedBox(height: 20,),
                Text(singlePost["body"].toString(), style: TextStyle(fontSize: 20, color: Colors.orange),), 
            
            
              ],
            ),
          )
    );
  }
}
