/*import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class ImagePreview extends StatefulWidget {
  XFile file;
  ImagePreview({Key? key, required this.file}) : super(key: key);

  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  @override
  Widget build(BuildContext context) {
    File picture = File(widget.file.path);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Image.file(picture),
          ),
          // Custom Button
          SafeArea(
            child: Container(
              height: 35,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0x10000000),
                      ),
                      child: Icon(Icons.arrow_back_ios_new_outlined),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/


import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconly/iconly.dart';
import 'package:path/path.dart';

class PreviewScreen extends StatefulWidget{
  XFile file;
  PreviewScreen({Key? key, required this.file}) : super(key: key);

  @override
  _PreviewScreenState createState() => _PreviewScreenState();

}
class _PreviewScreenState extends State<PreviewScreen>{
  @override
  Widget build(BuildContext context) {
    File picture = File(widget.file.path);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(IconlyLight.arrow_left_2,),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share,color: Colors.white,),
            onPressed: (){
              getBytesFromFile().then((bytes){
                Share.file('Share', basename(widget.file.path), bytes.buffer.asUint8List(),'image/path');
              });
            },
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Image.file(picture,fit: BoxFit.cover,),
        ),
      ),
    );
  }

  Future<ByteData> getBytesFromFile() async{
    Uint8List bytes = File(widget.file.path).readAsBytesSync() as Uint8List;
    return ByteData.view(bytes.buffer);
  }
}