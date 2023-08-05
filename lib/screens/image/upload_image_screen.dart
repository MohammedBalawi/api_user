import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled6/utils/context-extenssion.dart';
// import 'package:vp17_api/utils/context-extenssion.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({Key? key}) : super(key: key);

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  late ImagePicker _imagePicker;
  XFile? _pickedImage;
  double? _value = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Upload Image',
          style: GoogleFonts.aBeeZee(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            color: Colors.green,
            minHeight: 6,
            value: _value,
          ),
          Expanded(
            child: _pickedImage != null
                ? Image.file(File(_pickedImage!.path))
                : IconButton(
                    onPressed: () => _pickImage(),
                    icon: Icon(Icons.camera),
                    iconSize: 50,
                  ),
          ),
          ElevatedButton.icon(
            onPressed: () => _performUpload(),
            icon: Icon(Icons.cloud_upload),
            label: Text(
              'UPLOAD',
              style: GoogleFonts.aBeeZee(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
            ),
          ),
        ],
      ),
    );
  }

  void _pickImage() async {
    XFile? imageFile = await _imagePicker.pickImage(source: ImageSource.camera);
    if (imageFile != null) {
      setState(() => _pickedImage = imageFile);
    }
  }

  void _performUpload() {
    if (_checkData()) {
      _uploadImage();
    }
  }

  bool _checkData() {
    if (_pickedImage != null) {
      return true;
    }
    context.showSnackBar(message: 'Pick image to upload', error: true);
    return false;
  }

  void _uploadImage() {
    //TODO: Call upload image api request
    _changeProgressValue();
  }

  void _changeProgressValue({double? value}) {
    setState(() => _value = value);
  }
}
