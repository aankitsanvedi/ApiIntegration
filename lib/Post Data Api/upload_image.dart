import 'dart:typed_data';

import 'package:api_integration/Service/api_services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadImagePost extends StatefulWidget {
  const UploadImagePost({super.key});

  @override
  State<UploadImagePost> createState() => _UploadImagePostState();
}

class _UploadImagePostState extends State<UploadImagePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
      ),
      body: Column(
        children: [
          SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () async {
                    final ImagePicker picker = ImagePicker();
                    final XFile? image =
                        await picker.pickImage(source: ImageSource.gallery);

                        if (image != null) {
                          Uint8List bytes = await image.readAsBytes();
                          ApiService().postUploadImage(bytes, image.name).then((value) {print(value.toString());}).onError((error, stackTrace) {
                            print(error.toString());
                          });
                          
                        }
                  },
                  child: Text('Upload Image')))
        ],
      ),
    );
  }
}
