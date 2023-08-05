import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled6/api/api_imge_respo.dart';
import 'package:untitled6/get/get_image_controller.dart';

class ImagesScreen extends StatelessWidget {
  const ImagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Images',style: GoogleFonts.aBeeZee(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.pushNamed(context, '/upload_image_screen'),
            icon: Icon(Icons.camera),
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return Card(
            clipBehavior: Clip.antiAlias,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Image.network(''),
                Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Container(
                    padding: EdgeInsetsDirectional. only (start: 10),
                    height: 50,
                    width: double.infinity,
                    color: Colors.black45,
                    child: Row(children: [
                      const Expanded(


                          child: Text('image',
                            overflow: TextOverflow.ellipsis,)),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete,color: Colors.red,),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  void _deleteImage (int index) async {
    // ApiImageResponse apiResponse = await GetImageController.to.delete(index);
  }
}
