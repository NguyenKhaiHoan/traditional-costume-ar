import '/controller/costume_controller.dart';
import '/models/costume.dart';
import '/pages/try_on.dart';
import '/screens/view_3d.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailScreen2 extends StatefulWidget {
  final String costumeId;
  final String costumeName;
  final String gender;
  final String imageURL;
  final String decription;
  final String url;
  final String story;
  const DetailScreen2({Key? key, required this.costumeId, required this.costumeName, required this.gender, required this.imageURL, required this.decription, required this.url, required this.story}) : super(key: key);

  @override
  State<DetailScreen2> createState() => _DetailScreen2State();
}

class _DetailScreen2State extends State<DetailScreen2> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Costume> costumeList = Costume.costumeList;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Stack(
            children: [
              SizedBox(
                height: size.height * (1 - 0.53),
                width: size.width,
                child: Image.network(widget.imageURL),
              ),
              SafeArea(
                child: Padding(
                  padding:
                  const EdgeInsets.only(left: 20, top: 10, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CreateIcons(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          IconlyLight.arrow_left_2,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: IconButton(
                                onPressed: () {
                                },
                                icon: Icon(IconlyLight.heart, color: Colors.black,)
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CreateIcons(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute( builder: ((context) => View3DScreen())));
                              },
                              child: Image.asset('assets/images/cube_3d.png', height: 25, width: 25,)
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          BottomInfoSheet(
              child: [
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    children: [
                      Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Nguyễn",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                widget.costumeName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(IconlyLight.time_circle, size: 17,),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text('2 phút đọc')
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => TryOnPage()),
                                  );
                                },
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('THỬ', style: TextStyle(color: Colors.black, fontSize: 14),),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(IconlyLight.arrow_right_2, color: Colors.black, size: 14,)
                                      ],
                                    ),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.yellow[600],
                                ),
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              ReadMoreText(
                                widget.decription,
                                trimLines: 4,
                                colorClickableText: Colors.black,
                                moreStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                                lessStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                                trimMode: TrimMode.Line,
                                trimCollapsedText: '\n\nĐọc thêm >',
                                trimExpandedText: '\n\n< Rút gọn',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Divider(
                                color: Colors.grey[300],
                                thickness: 1,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Thêm',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Icon(IconlyLight.user, size: 18, color: Colors.black,),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text('Giới tính: ' + widget.gender, style: TextStyle(fontSize: 16),),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Divider(
                                color: Colors.grey[300],
                                thickness: 1,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Câu chuyện',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ReadMoreText(
                                widget.story,
                                trimLines: 4,
                                colorClickableText: Colors.black,
                                moreStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                                lessStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                                trimMode: TrimMode.Line,
                                trimCollapsedText: '\n\nĐọc thêm >',
                                trimExpandedText: '\n\n< Rút gọn',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Divider(
                                color: Colors.grey[300],
                                thickness: 1,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Có thể bạn sẽ thích',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: double.infinity,
                                height: 230,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage('assets/images/example-${index}.png'),
                                                  fit: BoxFit.fitWidth,
                                                ),
                                                borderRadius: BorderRadius.circular(5),
                                              ),
                                              height: 160,
                                              width: 160,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              costumeList[index].category.toUpperCase(),
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              costumeList[index].costumeName,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(
                                      width: 10,
                                    );
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          )
                      )
                    ],
                  ),
                ),
              ]
          )
        ],
      ),
    );
  }
}

class CreateIcons extends StatelessWidget {
  final Widget child;
  final Function()? onTap;
  const CreateIcons({
    Key? key,
    required this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: GestureDetector(onTap: onTap, child: child),
    );
  }
}

class BottomInfoSheet extends StatelessWidget {
  final List<Widget> child;
  final double? minSize;

  const BottomInfoSheet({
    Key? key,
    required this.child,
    this.minSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: DraggableScrollableSheet(
          initialChildSize: minSize == null ? 0.55 : minSize!,
          minChildSize: minSize == null ? 0.55 : minSize!,
          maxChildSize: 0.85,
          builder: (context, con) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Container(
                  color: Colors.white,
                  child: ListView(
                    controller: con,
                    children: child,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
