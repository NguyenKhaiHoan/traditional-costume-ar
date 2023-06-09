import '../models/costume_firebase.dart';
import '/models/costume.dart';
import '/screens/detail.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController();
  String hiString = "";

  List<Costume> popularCostume = [
    Costume(costumeId: 0, category: 'NGUYỄN', gender: "Nam", costumeName: "Áo Tấc", imageURL: 'assets/images/example-0.png', images: [], decription: "decription"),
    Costume(costumeId: 1, category: 'LÝ', gender: "Nam", costumeName: "Viên Lĩnh", imageURL: 'assets/images/example-1.png', images: [], decription: "decription"),
    Costume(costumeId: 2, category: 'NGUYỄN', gender: "Nữ", costumeName: "Áo Nhật Bình", imageURL: 'assets/images/example-2.png', images: [], decription: "decription")
  ];

  List<Costume2> upStandingCostume = [];

  @override
  void initState() {
    super.initState();
    final hour = DateTime.now().hour;
    print(hour);
    if (hour < 12) {
      hiString = "Chào buổi sáng";
    } else if (hour < 18) {
      hiString = "Chào buổi chiều";
    } else {
      hiString = "Chào buổi tối";
    }
    getUsers();
  }

  final List<Costume2> list = [];

  getUsers() async {
    final snapshot = await FirebaseDatabase.instance.ref('mesh').get();

    final map = snapshot.value as Map<dynamic, dynamic>;

    map.forEach((key, value) {
      final user = Costume2.fromMap(value);
      list.add(user);
    });
    print(list);


  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height - 60,
          child: PageView(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            children: List.generate(3,
              (int index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    createRoute(DetailScreen(costumeId: index,)));
                },
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            popularCostume[index].imageURL,
                          ),
                        ),
                      ),
                    ),
                    SafeArea(
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                hiString,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                        ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        padding: EdgeInsets.only(left: 20, right: 20, bottom: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(popularCostume[index].category, style: TextStyle(color: Colors.white, fontSize: 14),),
                            SizedBox(
                              height: 14,
                            ),
                            Text(popularCostume[index].costumeName, style: TextStyle(color: Colors.white, fontSize: 30),),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Center(
                                  child: Row(
                                    children: [
                                      Text('TÌM HIỂU THÊM', style: TextStyle(color: Colors.white, fontSize: 12),),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(IconlyLight.arrow_right, color: Colors.white, size: 15,)
                                    ],
                                  ),
                                ),
                                SmoothPageIndicator(
                                  controller: _pageController,
                                  count: 3,
                                  effect: ExpandingDotsEffect(
                                      activeDotColor: Color(0xFFFFFFFF),
                                      dotColor: Color(0xFFababab),
                                      dotHeight: 4.8,
                                      dotWidth: 6,
                                      spacing: 4.8),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ),
          ),
        ),
      ),
    );
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