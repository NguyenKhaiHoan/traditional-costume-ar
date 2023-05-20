import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:camera/camera.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../controller/costume_controller.dart';
import '/models/costume.dart';
import '/screens/image_preview.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class TryOnPage extends StatefulWidget {
  @override
  _TryOnPageState createState() => _TryOnPageState();
}

class _TryOnPageState extends State<TryOnPage> with SingleTickerProviderStateMixin {
  late PageController _pageController;
  CameraController? controller;
  ArCoreNode? node;
  late List<CameraDescription> cameras;
  late int selectedCameraIndex;
  List<Costume> costumeList = Costume.costumeList;
  late TabController _tabController;
  int currentIndex = 0;
  late ArCoreController arCoreController;
  late String url;

  DatabaseReference db_Ref = FirebaseDatabase.instance.ref().child('mesh');

  Iterable<Costume> nguyenList = Costume.costumeList.where((costume) => costume.category == "Nguyễn").map((e) => Costume(costumeId: e.costumeId, costumeName: e.costumeName, category: e.category, gender: e.gender, imageURL: e.imageURL, images: e.images, decription: e.decription, ));
  Iterable<Costume> lyList = Costume.costumeList.where((costume) => costume.category == "Lý").map((e) => Costume(costumeId: e.costumeId, costumeName: e.costumeName, category: e.category, gender: e.gender, imageURL: e.imageURL, images: e.images, decription: e.decription, ));
  Iterable<Costume> namList = Costume.costumeList.where((costume) => costume.gender == "Nam").map((e) => Costume(costumeId: e.costumeId, costumeName: e.costumeName, category: e.category, gender: e.gender, imageURL: e.imageURL, images: e.images, decription: e.decription, ));
  Iterable<Costume> nuList = Costume.costumeList.where((costume) => costume.gender == "Nữ").map((e) => Costume(costumeId: e.costumeId, costumeName: e.costumeName, category: e.category, gender: e.gender, imageURL: e.imageURL, images: e.images, decription: e.decription, ));


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    _pageController = PageController(initialPage: 0);
    availableCameras().then((availableCameras) {
      cameras = availableCameras;
      if (cameras.length > 0) {
        setState(() {
          selectedCameraIndex = 0;
        });
        _initCameraController(cameras[selectedCameraIndex]).then((void v) {});
      } else {
        print('No camera available');
      }
    }).catchError((err) {
      print('Error :${err.code}Error message : ${err.message}');
    });
  }

  Future _initCameraController(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller!.dispose();
    }
    controller = CameraController(cameraDescription, ResolutionPreset.high);

    controller!.addListener(() {
      if (mounted) {
        setState(() {});
      }

      if (controller!.value.hasError) {
        print('Camera error ${controller!.value.errorDescription}');
      }
    });

    try {
      await controller!.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(IconlyLight.arrow_left_2,),
        ),
      ),
      backgroundColor: Colors.black,
      floatingActionButton: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    if (controller == null ||
        !controller!.value.isInitialized) {
      return Container(
        decoration: BoxDecoration(color: Colors.white),
        width: size.width,
        height: size.height,
        child: Center(
            child: SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                ))),
      );
    }
    return Container(
      width: size.width,
      height: size.height,
      child: PageView(
        onPageChanged: (int page) {
          setState(() {
            currentIndex = page;
          });
        },
        controller: _pageController,
        children: [
          _cameraPreviewWidgetTryOn(),
          _cameraPreviewWidgetAR(),
        ],
      ),
    );
  }

  /// Display Camera preview.
  Widget _cameraPreviewWidgetTryOn() {
    if (controller == null || !controller!.value.isInitialized) {
      return const Text(
        'Loading',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
        ),
      );
    }

    return AspectRatio(
      aspectRatio: controller!.value.aspectRatio,
      child: CameraPreview(controller!),
    );
  }

  Widget _cameraPreviewWidgetAR() {
    if (controller == null || !controller!.value.isInitialized) {
      return const Text(
        'Loading',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
        ),
      );
    }

    return AspectRatio(
      aspectRatio: controller!.value.aspectRatio,
      child: CameraPreview(controller!, child: ArCoreView(
        onArCoreViewCreated: _onArCoreViewCreated,
        enablePlaneRenderer: true,
        enableTapRecognizer: true,
        enableUpdateListener: true,
      )),
    );
  }

  Widget getFooter() {
    CameraDescription selectedCamera = cameras[selectedCameraIndex];
    // CameraLensDirection lensDirection = selectedCamera.lensDirection;
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: MediaQuery.of(context).size.height / 4,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.4),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                topLeft: Radius.circular(15)
                            )
                        ),
                        child: Column(
                          children: [
                            TabBar(
                              controller: _tabController,
                              indicatorColor: Colors.white,
                              labelColor: Colors.white,
                              tabs: [
                                Tab(icon: Icon(IconlyLight.heart)),
                                Tab(text: 'Tất cả',),
                                Tab(text: 'Nổi bật',),
                                Tab(text: 'Nguyễn'),
                                Tab(text: 'Lý'),
                                Tab(text: 'Nam'),
                                Tab(text: 'Nữ'),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.black.withOpacity(0.2),
                                margin: const EdgeInsets.only(top: 10),
                                child: TabBarView(
                                  controller: _tabController,
                                  children: [
                                    // GridView.count(
                                    //   crossAxisCount: 5,
                                    //   children: List.generate(Get.find<CostumeController>().favoriteCostume.length, (index) {
                                    //     return Container(
                                    //       child: Center(
                                    //         child: ClipRRect(
                                    //           borderRadius: BorderRadius.circular(10),
                                    //           child: Image.asset(
                                    //             Get.find<CostumeController>().favoriteCostume.elementAt(index).imageURL,
                                    //             fit: BoxFit.cover,
                                    //             height: 60,
                                    //             width: 60,
                                    //           ),
                                    //         ),
                                    //       ),
                                    //     );
                                    //   }),
                                    // ),
                                    GridView.count(
                                      crossAxisCount: 5,
                                      children: List.generate(nguyenList.length, (index) {
                                        return Container(
                                          child: Center(
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image.asset(
                                                nguyenList.elementAt(index).imageURL,
                                                fit: BoxFit.cover,
                                                height: 60,
                                                width: 60,
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                    GridView.count(
                                      crossAxisCount: 5,
                                      children: List.generate(costumeList.length, (index) {
                                        return Container(
                                          child: Center(
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image.asset(
                                                'assets/images/example-$index.png',
                                                fit: BoxFit.cover,
                                                height: 60,
                                                width: 60,
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                    FirebaseAnimatedList(
                                      query: db_Ref,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
                                        Map mesh = snapshot.value as Map;
                                        return Row(
                                          children: [
                                            GestureDetector(
                                              child: Container(
                                                child: Center(
                                                  child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(10),
                                                    child: Image.network(
                                                      mesh['imageUrl'],
                                                      fit: BoxFit.cover,
                                                      height: 60,
                                                      width: 60,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  url = mesh['url'];
                                                });
                                              },
                                            ),
                                            SizedBox(
                                              width: 10,
                                            )
                                          ],
                                        );
                                      },
                                    ),
                                    GridView.count(
                                      crossAxisCount: 5,
                                      children: List.generate(nguyenList.length, (index) {
                                        return Container(
                                          child: Center(
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image.asset(
                                                nguyenList.elementAt(index).imageURL,
                                                fit: BoxFit.cover,
                                                height: 60,
                                                width: 60,
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                    GridView.count(
                                      crossAxisCount: 5,
                                      children: List.generate(lyList.length, (index) {
                                        return Container(
                                          child: Center(
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image.asset(
                                                lyList.elementAt(index).imageURL,
                                                fit: BoxFit.cover,
                                                height: 60,
                                                width: 60,
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                    GridView.count(
                                      crossAxisCount: 5,
                                      children: List.generate(namList.length, (index) {
                                        return Container(
                                          child: Center(
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image.asset(
                                                namList.elementAt(index).imageURL,
                                                fit: BoxFit.cover,
                                                height: 60,
                                                width: 60,
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                    GridView.count(
                                      crossAxisCount: 5,
                                      children: List.generate(nuList.length, (index) {
                                        return Container(
                                          child: Center(
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image.asset(
                                                nuList.elementAt(index).imageURL,
                                                fit: BoxFit.cover,
                                                height: 60,
                                                width: 60,
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
                icon: Icon(
                  Icons.filter_none_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 7, color: Colors.white),
                  color: Colors.transparent,
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      _onCapturePressed(context);
                    },
                  ),
                )
              ),
              SizedBox(
                width: 15,
              ),
              IconButton(
                icon: Icon(
                  Icons.restart_alt,
                  color: Colors.white,
                  size: 28,
                ),
                onPressed: () {
                  _onSwitchCamera();
                },
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            currentIndex == 0 ? 'Try on' : 'AR View',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: 2,
            effect: ExpandingDotsEffect(
                activeDotColor: Color(0xFFFFFFFF),
                dotColor: Color(0xFFababab),
                dotHeight: 4.8,
                dotWidth: 6,
                spacing: 4.8),
          ),
        ],
      ),
    );
  }

  void _showCameraException(CameraException e) {
    String errorText = 'Error:${e.code}\nError message : ${e.description}';
    print(errorText);
  }

  void _onCapturePressed(context) async {
    XFile file = await controller!.takePicture();
    Navigator.push(context, MaterialPageRoute( builder: ((context) => PreviewScreen(file: file))));
  }

  void _onArCoreViewCreated(ArCoreController controller) {
    arCoreController = controller;
    arCoreController?.onNodeTap = (name) => onTapHandler(name);
    arCoreController?.onPlaneTap = _handleOnPlaneTap;
  }

  void _addToucano(ArCoreHitTestResult plane) {
    final toucanNode = ArCoreReferenceNode(
        name: "Toucano",
        objectUrl: url,
        // objectUrl: "https://firebasestorage.googleapis.com/v0/b/ar-try-on-1b5c9.appspot.com/o/file%2FMidnight%20Elegance%2FMidnight%20Elegance.glb?alt=media&token=0420b4a3-96f9-459f-a928-1df2eb5203f3",
        position: plane.pose.translation,
        rotation: plane.pose.rotation);

    arCoreController?.addArCoreNodeWithAnchor(toucanNode);
  }

  void _handleOnPlaneTap(List<ArCoreHitTestResult> hits) {
    final hit = hits.first;
    _addToucano(hit);
  }

  void onTapHandler(String name) {
    print("Flutter: onNodeTap");
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: Row(
          children: <Widget>[
            Text('Remove $name?'),
            IconButton(
                icon: Icon(
                  Icons.delete,
                ),
                onPressed: () {
                  arCoreController?.removeNode(nodeName: name);
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }

  void _onSwitchCamera() {
    selectedCameraIndex = selectedCameraIndex < cameras.length - 1 ? selectedCameraIndex + 1 : 0;
    CameraDescription selectedCamera = cameras[selectedCameraIndex];
    _initCameraController(selectedCamera);
  }

  @override
  void dispose() {
    arCoreController.dispose();
    super.dispose();
  }
}