import 'package:babylonjs_viewer/babylonjs_viewer.dart';
import 'package:flutter/material.dart';
// import 'package:model_viewer_plus/model_viewer_plus.dart';

// creating class of stateful widget
class View3DScreen extends StatefulWidget {
  @override
  _View3DScreenState createState() => _View3DScreenState();
}

class _View3DScreenState extends State<View3DScreen> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: Container(
              color: Colors.white,
              child: Center(
                child: BabylonJSViewer(
                  src: 'assets/cubes/black.glb',
                ),
              )
            )
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.close_sharp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}