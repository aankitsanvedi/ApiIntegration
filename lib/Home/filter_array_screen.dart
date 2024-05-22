import 'package:api_integration/Service/api_services.dart';
import 'package:flutter/material.dart';

import '../Model/filter_array_model.dart';

class FilterArrayScreen extends StatefulWidget {
  const FilterArrayScreen({super.key});

  @override
  State<FilterArrayScreen> createState() => _FilterArrayScreenState();
}

class _FilterArrayScreenState extends State<FilterArrayScreen> {
  bool isLoading = false;

  getUserList() {
    setState(() {
      isLoading = true;
    });
    ApiService().filterGender().then((value) {
      // print(value.toString());
      _forMale(value!.users!);
      _forFemale(value!.users!);

      setState(() {
        isLoading = false;
      });
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }

// for male
  List<Users> maleList = [];
  List<Users> _forMale(List<Users> list) {
    for (var element in list) {
      if (element.gender == "male") {
        maleList.add(element);
      }
    }
    return maleList;
  }

// for Female
  List<Users> femaleList = [];
  List<Users> _forFemale(List<Users> list) {
    for (var element in list) {
      if (element.gender == "female") {
        femaleList.add(element);
      }
    }
    return femaleList;
  }

  @override
  void initState() {
    getUserList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: const Text('Filter App Bar'),
          bottom: const TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              unselectedLabelStyle:
                  TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              unselectedLabelColor: Colors.black,
              labelPadding: EdgeInsets.symmetric(vertical: 8),
              tabs: [Text('Male'), Text('Female')]),
        ),
        body: TabBarView(children: [_maleUsers(), _femaleUsers()]),
      ),
    );
  }

  _maleUsers() {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(color: Colors.deepOrangeAccent,),
          )
        : ListView.builder(
            itemCount: maleList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text((index + 1).toString()),
                ),
                title: Text(maleList[index].firstName.toString()),
                subtitle: Text(maleList[index].age.toString()),
                trailing: Text(maleList[index].gender.toString()),
              );
            });
  }

  _femaleUsers() {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(color: Colors.deepOrangeAccent,),
          )
        : ListView.builder(
            itemCount: femaleList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: Text((index + 1).toString()),
                ),
                title: Text(femaleList[index].firstName.toString()),
                subtitle: Text(femaleList[index].age.toString()),
                trailing: Text(femaleList[index].gender.toString()),
              );
            });
  }
}
