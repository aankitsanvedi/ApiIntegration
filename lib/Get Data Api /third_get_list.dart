import 'package:api_integration/Model/third_screen_model.dart';
import 'package:api_integration/Service/api_services.dart';
import 'package:flutter/material.dart';

class ThirdGetList extends StatefulWidget {
  const ThirdGetList({super.key});

  @override
  State<ThirdGetList> createState() => _ThirdGetListState();
}

class _ThirdGetListState extends State<ThirdGetList> {
  bool isLoading = false;
  List<ThirdScreenModel> thirdScreenModel = [];
  _getposts(){
    isLoading = true;
    ApiService().getThirdScreenModel().then((value) {
      setState(() {
        thirdScreenModel = value!;
        isLoading = false;
      });
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    _getposts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Screen Api GET'),
      ),
      body: isLoading == true? Center(
        child: CircularProgressIndicator(),
      ):
      ListView.builder(itemCount: thirdScreenModel.length, itemBuilder: (context, index){
        return Card(
          margin: EdgeInsets.all(10),
          child: ListTile(
            leading: Text(thirdScreenModel[index].userId.toString()),
            title: Text(thirdScreenModel[index].title.toString()),
            subtitle: Text(thirdScreenModel[index].body.toString()),
          ),
        );
      })
    );
  }
}