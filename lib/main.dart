import 'package:api_integration/Home/filter_array_screen.dart';
import 'package:api_integration/Post%20Data%20Api/first_post_data.dart';
import 'package:api_integration/Post%20Data%20Api/parse_header_test.dart';
import 'package:api_integration/Post%20Data%20Api/registered_post_data.dart';
import 'package:api_integration/Post%20Data%20Api/second_withoutmodle_post.dart';
import 'package:api_integration/Post%20Data%20Api/jobcreate_post_api.dart';
import 'package:api_integration/Post%20Data%20Api/upload_image.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Api Integration',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FilterArrayScreen(),
    );
  }
}
