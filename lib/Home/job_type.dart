import 'package:flutter/material.dart';

class JobType extends StatefulWidget {
  final String? id, name, job; 
  const JobType({Key? key, this.id, this.name, this.job}) : super(key: key);

  @override
  State<JobType> createState() => _JobTypeState();
}

class _JobTypeState extends State<JobType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Id'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Id :${widget.id.toString()}'),
            Text('Name: ${widget.name.toString()}'),
            Text('job type: ${widget.job.toString()}'),
            
          ],
        ),
      ),
    );
  }
}