import 'package:api_integration/Model/fifth_multidata_model.dart';
import 'package:api_integration/Service/api_services.dart';
import 'package:flutter/material.dart';

class FifthApiGet extends StatefulWidget {
  const FifthApiGet({super.key});

  @override
  State<FifthApiGet> createState() => _FifthApiGetState();
}

class _FifthApiGetState extends State<FifthApiGet> {
  bool isLoading = false;
  FifthMultiDataModel multiDataModel = FifthMultiDataModel();

  
  _getMultiData() {
    isLoading = true;
    ApiService().getMultiData().then((value) {
      setState(() {
        multiDataModel = value!;
        isLoading = false;
      });
    }).onError((error, stackTrace) {
      print(error);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _getMultiData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi Data Model'),
        centerTitle: true,
      ),
      body: isLoading == true ? 
      Center(child: CircularProgressIndicator(),):
      
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(multiDataModel.page.toString()),
              Text(multiDataModel.total.toString()),
              Text(multiDataModel.perPage.toString()),
              Text(multiDataModel.totalPages.toString()),
            ],
          ),
          SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
              itemCount: multiDataModel.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(multiDataModel.data![index].name.toString()),
                    subtitle: Text(multiDataModel.data![index].year.toString()),
                    leading: Text(multiDataModel.data![index].id.toString()),
                   
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
