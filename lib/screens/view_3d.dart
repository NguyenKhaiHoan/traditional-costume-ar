import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

// creating class of stateful widget
class View3DScreen extends StatefulWidget {
  final String url;

  const View3DScreen({super.key, required this.url});
  @override
  _View3DScreenState createState() => _View3DScreenState();
}

class _View3DScreenState extends State<View3DScreen> {
  late String url;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    url = widget.url;
  }
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
                child: ModelViewer(
                  src: url,
                  ar: true,
                  autoRotate: true,
                  cameraControls: true,
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
                      color: Colors.black,
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