import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class pick extends StatefulWidget {
  const pick({Key? key}) : super(key: key);

  @override
  _pickState createState() => _pickState();
}

class _pickState extends State<pick> {
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Upload Image"),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  final XFile? image =
                      await _picker.pickImage(source: ImageSource.gallery);
                },
                child: Text("Upload Image")),
          )
        ],
      ),
    );
  }
}
