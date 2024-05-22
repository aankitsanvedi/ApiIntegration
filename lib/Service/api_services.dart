import 'dart:convert';
import 'dart:typed_data';

import 'package:api_integration/Model/fifth_multidata_model.dart';
import 'package:api_integration/Model/filter_array_model.dart';
import 'package:api_integration/Model/fourth_get_model.dart';
import 'package:api_integration/Model/third_screen_model.dart';

import '../Model/header_parsing_model.dart';
import '../Model/job_create_model.dart';
import '../Model/login_response_model.dart';
import '../Model/registration_post_api.dart';
import '../Model/single_post_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  var Base_Url = "https://jsonplaceholder.typicode.com";
  var Url = "https://reqres.in";

  // WithModel
  // Future<SinglePostWithmodel?> getSinglePostWithModel() async {
  //   try {
  //     var url = Uri.parse(Base_Url + '/posts/1');
  //     var response = await http.get(url);

  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       SinglePostWithmodel singlePostWithmodel =
  //           SinglePostWithmodel.fromJson(json.decode(response.body));

  //       return singlePostWithmodel;
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

// WithoutModel

  Future<dynamic> getSinglePostWithOutModel() async {
    try {
      var url = Uri.parse(Base_Url + '/posts/1');
      var response = await http.get(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = response.body;
        final data = jsonDecode(body);

        return data;
      }
    } catch (e) {
      print(e.toString());
    }
  }

// screen list with model
  Future<List<ThirdScreenModel>?> getThirdScreenModel() async {
    try {
      var url = Uri.parse(Base_Url + '/posts');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<ThirdScreenModel> thirdscreenmodel = List<ThirdScreenModel>.from(
            jsonDecode(response.body).map((x) => ThirdScreenModel.fromJson(x)));
        return thirdscreenmodel;
      }
    } catch (e) {
      print(e.toString());
    }

    return null;
  }

  // List Model
  Future<List<FourthTestModel>?> getFourthScreenModel() async {
    try {
      var url = Uri.parse(Base_Url + '/albums');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<FourthTestModel> fourthtestmodel = List<FourthTestModel>.from(
            jsonDecode(response.body).map((x) => FourthTestModel.fromJson(x)));

        return fourthtestmodel;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  // MultiData With Model
  Future<FifthMultiDataModel?> getMultiData() async {
    try {
      var url = Uri.parse(Url + '/api/unknown');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        FifthMultiDataModel multiDataModel =
            FifthMultiDataModel.fromJson(jsonDecode(response.body));
        return multiDataModel;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  // MultiData Without Model
  Future<FifthMultiDataModel?> getMultiDataWithoutModel() async {
    try {
      var url = Uri.parse(Url + '/api/unknown');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        final model = jsonDecode(response.body);
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  // Without Model User Login PostApi
  Future<dynamic> userWithoutModelLogin(String email, String password) async {
    try {
      var url = Uri.parse(Url + '/api/login');
      var response = await http.post(
        url,
        body: {"email": email, "password": password},
      );
      if (response.statusCode == 200) {
        // LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(jsonDecode(response.body));
        final loginModel = jsonDecode(response.body);
        return loginModel;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //UserLogin PostApi
  Future<LoginResponseModel?> userLogin(String email, String password) async {
    try {
      var url = Uri.parse(Url + '/api/login');
      var response = await http.post(
        url,
        body: {"email": email, "password": password},
      );
      if (response.statusCode == 200) {
        LoginResponseModel loginResponseModel =
            LoginResponseModel.fromJson(jsonDecode(response.body));
        return loginResponseModel;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //Job Create PostApi
  Future<JobCreateModel?> userJobCreated(String name, String job) async {
    try {
      var url = Uri.parse(Url + '/api/users');
      var response = await http.post(
        url,
        body: {"name": name, "job": job},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        JobCreateModel jobCreateModel =
            JobCreateModel.fromJson(jsonDecode(response.body));
        return jobCreateModel;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // Registration PostApi
  Future<RegistrationModel?> userRegistration(
      String email, String password) async {
    try {
      var url = Uri.parse(Url + '/api/register');
      var response = await http.post(
        url,
        body: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        RegistrationModel registrationModel =
            RegistrationModel.fromJson(jsonDecode(response.body));
        return registrationModel;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // WithModel
  Future<SinglePostWithmodel?> getSinglePostWithModel() async {
    try {
      var url = Uri.parse(Base_Url + '/posts/1');
      var response = await http.get(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        SinglePostWithmodel singlePostWithmodel =
            SinglePostWithmodel.fromJson(json.decode(response.body));

        return singlePostWithmodel;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // Header Parsing Get
  Future<dynamic> getUserDetails() async {
    String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjEsImlhdCI6MTcxNjI5NTA2MCwiZXhwIjoxNzE4MDIzMDYwfQ.Z0aFOoiOY0waIVTRbGTjC5bwTXFQZUphuRh-YioYzZ8';
    try {
      var response = await http.get(
          Uri.parse('https://api.escuelajs.co/api/v1/auth/profile'),
          headers: {"Authorization": "Bearer $token"});

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
  }


  // Image Upload
  Future<dynamic> postUploadImage(Uint8List bytes, String filename) async{
    var request = http.MultipartRequest('POST', Uri.parse('https://api.escuelajs.co/api/v1/files/upload?'));

    var multipartFile = http.MultipartFile(
      'file',
      http.ByteStream.fromBytes(bytes),
      bytes.length,
      filename: filename
    );

    request.files.add(multipartFile);
    final response = await request.send();


    if (response.statusCode == 201) {
      var data = await response.stream.bytesToString();
      return jsonDecode(data);
      
    }else
    {
      return null;
    }
  }


  Future<FilterArrayModel?> filterGender() async {
      var response = await http.get(Uri.parse('https://dummyjson.com/users'));

    if (response.statusCode == 200) {
      return FilterArrayModel.fromJson(jsonDecode(response.body));

    } else {
      return null;
    }
  }
}
