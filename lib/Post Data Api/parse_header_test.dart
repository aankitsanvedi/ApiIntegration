import 'package:api_integration/Service/api_services.dart';
import 'package:flutter/material.dart';

class ParseHeaderTest extends StatefulWidget {
  const ParseHeaderTest({super.key});

  @override
  State<ParseHeaderTest> createState() => _ParseHeaderTestState();
}

class _ParseHeaderTestState extends State<ParseHeaderTest> {
  dynamic userDetails;
  bool isLoading = false;

  getUserDetails() {
    setState(() {
      isLoading = true;
    });
    ApiService().getUserDetails().then((value) {
      print('user Details:-  ${value.toString()}');
      setState(() {
        userDetails = value;
        isLoading = false;
      });
    }).onError((error, stackTrace) {
      print(error.toString());
      isLoading = false;
    });
  }

  @override
  void initState() {
    getUserDetails();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Header Parsing'),
      ),
      body: Center(
        child: isLoading == true
            ? CircularProgressIndicator()
            : Column(
                children: [
                  ClipOval(
                    child: Image.network(userDetails['avatar']),
                  ),
                  Text(
                    userDetails['name'].toString(), style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Text(userDetails['role'].toString(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w100),),
                  Text(userDetails['email'], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w100),),
                ],
              ),
      ),
    );
  }
}
