import 'package:api_integration/Home/home_screen.dart';
import 'package:api_integration/Home/job_type.dart';
import 'package:api_integration/Model/job_create_model.dart';
import 'package:api_integration/Service/api_services.dart';
import 'package:flutter/material.dart';

class JobCreatePostApi extends StatefulWidget {
  const JobCreatePostApi({super.key});

  @override
  State<JobCreatePostApi> createState() => _JobCreatePostApiState();
}

class _JobCreatePostApiState extends State<JobCreatePostApi> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController jobTypeController = TextEditingController();
  bool isLoading = false;

  JobCreateModel jobCreateModel = JobCreateModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Create'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: userNameController,
              decoration: const InputDecoration(
                hintText: 'User Name',
                label: Text('User Name'),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextField(
              controller: jobTypeController,
              decoration: const InputDecoration(
                  hintText: 'JobType', label: Text('Job Type')),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(
                    () {
                      isLoading = true;
                    },
                  );
                  _jobIdCreated();
                },
                child: isLoading == true
                      ? const Center(
                        child: CircularProgressIndicator(),
                      )
                      : Text('Job Created'))
          ],
        ),
      ),
    );
  }

  _jobIdCreated() {
    ApiService().userJobCreated(userNameController.text.toString(), jobTypeController.text.toString()).then((value) {
      setState(() {
        isLoading=false;
        jobCreateModel = value!;
        print(jobCreateModel.name);

        Navigator.push(context, MaterialPageRoute(builder: (context)=>JobType(
          id : jobCreateModel.id.toString(),
          name: jobCreateModel.name.toString(),
          job: jobCreateModel.job.toString()
                 )));

      });
    }).onError((error, stackTrace) {
      isLoading = false;
      print(error);
    });
  }
}
