import 'package:traditional_costume_ar/pages/root.dart';

import '/controller/costume_controller.dart';
import '/pages/explore.dart';
import '/screens/category_dynasty.dart';
import '/screens/detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  bool displayList = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Yêu thích',
                    style: TextStyle(color: Colors.black),
                  )
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        displayList = true;
                      });
                    },
                    child: Icon(
                      Icons.view_list_sharp,
                      color: displayList ? Colors.yellow[600] : Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        displayList = false;
                      });
                    },
                    child: Icon(
                      Icons.grid_view_rounded,
                      color: !displayList ? Colors.yellow[600] : Colors.black,
                    ),
                  )
                ],
              )
            ],
          ),
          leadingWidth: 0,
        ),
        body: Obx(() => SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Get.put(CostumeController()).favoriteCostume.isEmpty
                      ? Column(
                          children: [
                            SizedBox(
                              height: 200,
                            ),
                            Image.asset(
                              'assets/images/empty.png',
                              height: 40,
                              width: 40,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Trang phục không được lưu trữ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Hãy đến trang Explore để bắt đầu lưu trữ các trang phục ',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              onPressed: () => Navigator.push(
                                context,
                                createRoute(
                                  Root(selectIndex: 1),
                                ),
                              ),
                              child: Container(
                                width: 150,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Đi đến Explore',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow[600],
                              ),
                            )
                          ],
                        )
                      : Column(
                          children: [
                            if (Get.find<CostumeController>()
                                .favoriteCostume
                                .isNotEmpty)
                              ...Get.find<CostumeController>()
                                  .favoriteCostume
                                  .map((costume) => GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                createRoute(DetailScreen(
                                                  costumeId: costume.costumeId,
                                                )));
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0x7fe5eaf4),
                                                  blurRadius: 15,
                                                  offset: Offset(0, 0),
                                                ),
                                              ],
                                              color: Colors.white,
                                            ),
                                            padding: const EdgeInsets.all(15),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 90,
                                                  height: 90,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                            'assets/images/example-${costume.costumeId}.png',
                                                          ),
                                                          fit:
                                                              BoxFit.fitWidth)),
                                                  // child: Image.asset('assets/images/example-${costume.costumeId}.png', height: 80,),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Container(
                                                  child: Container(
                                                    height: 82,
                                                    child: Column(
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Text(
                                                              costume.category
                                                                  .toUpperCase(),
                                                              style: TextStyle(
                                                                  fontSize: 12),
                                                            ),
                                                            SizedBox(
                                                              height: 4,
                                                            ),
                                                            Text(
                                                              costume
                                                                  .costumeName,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 16),
                                                            ),
                                                          ],
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ))
                                      ),
                          ],
                        )),
            )));
  }

  Route createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
