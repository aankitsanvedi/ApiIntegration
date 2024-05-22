import 'package:api_integration/Service/api_services.dart';
import 'package:flutter/material.dart';

import '../Model/fourth_get_model.dart';

class FourthTestApi extends StatefulWidget {
  const FourthTestApi({super.key});

  @override
  State<FourthTestApi> createState() => _FourthTestApiState();
}

class _FourthTestApiState extends State<FourthTestApi> {
  bool isLoading = false;
  List<FourthTestModel> fourthtestmodel = [];
  getFourthData(){

    isLoading= true;
    ApiService().getFourthScreenModel().then((value) {
      setState(() {
        fourthtestmodel = value!;
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getFourthData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fourth Api'),
      ),
      body: isLoading == true ? Center(
        child: CircularProgressIndicator(),
      ): 
      ListView.builder(itemCount: fourthtestmodel.length, itemBuilder: (context, index){
        return Center(
          child: Card(
            child: ListTile(
              title: Text(fourthtestmodel[index].userId.toString()),
              subtitle: Text(fourthtestmodel[index].title.toString()),
            ),
          ),
        );
      }) 
      
    );
  }
}