import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

import '../screens/category_gender.dart';
import '../screens/detail2.dart';
import '/models/costume.dart';
import '/screens/category_dynasty.dart';
import '/screens/detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<Costume> costumeList = Costume.costumeList;
  Iterable<Costume> nguyenList = Costume.costumeList.where((costume) => costume.category == "Nguyễn").map((e) => Costume(costumeId: e.costumeId, costumeName: e.costumeName, category: e.category, gender: e.gender, imageURL: e.imageURL, images: e.images, decription: e.decription, ));
  Iterable<Costume> tranList = Costume.costumeList.where((costume) => costume.category == "Trần").map((e) => Costume(costumeId: e.costumeId, costumeName: e.costumeName, category: e.category, gender: e.gender, imageURL: e.imageURL, images: e.images, decription: e.decription, ));
  Iterable<Costume> namList = Costume.costumeList.where((costume) => costume.gender == "Nam").map((e) => Costume(costumeId: e.costumeId, costumeName: e.costumeName, category: e.category, gender: e.gender, imageURL: e.imageURL, images: e.images, decription: e.decription, ));
  Iterable<Costume> nuList = Costume.costumeList.where((costume) => costume.category == "Nữ").map((e) => Costume(costumeId: e.costumeId, costumeName: e.costumeName, category: e.category, gender: e.gender, imageURL: e.imageURL, images: e.images, decription: e.decription, ));

  TextEditingController controller = TextEditingController();
  List<Costume> _searchResult = [];

  DatabaseReference db_Ref = FirebaseDatabase.instance.ref().child('mesh');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: _buildBody(context),
          ),
        )
      ),
    );
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    costumeList.forEach((costume) {
      if (costume.costumeName.contains(text) 
      || costume.costumeName.toLowerCase().contains(text)
      || costume.costumeName.toUpperCase().contains(text)) _searchResult.add(costume);
    });

    setState(() {});
  }

  Widget _buildBody(context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              TextField(
                controller: controller,
                onChanged: onSearchTextChanged,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.all(0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  prefixIcon: const Icon(
                    IconlyLight.search,
                    color: Colors.black,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(IconlyLight.close_square),
                    onPressed: () {
                      controller.clear();
                      onSearchTextChanged('');
                    },
                    color: Colors.black,
                  ),
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  hintText: "Search...",
                  filled: true,
                  fillColor: Colors.black12.withOpacity(0.1),
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          ),
          Container(
            child: _searchResult.length != 0 || controller.text.isNotEmpty
                ? _buildSearchResults()
                : _partBody(context)),
        ],
      );
  }

  Widget _partBody(context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RichText( text: const TextSpan(
            children: [
              TextSpan(
                text: 'Khám phá các ',
                style: TextStyle(fontSize: 36, wordSpacing: 3, letterSpacing: 5, color: Colors.black),
              ),
              TextSpan(
                  text: 'Trang Phục Truyền Thống',
                  style: TextStyle(fontSize: 36, wordSpacing: 3, letterSpacing: 5, fontWeight: FontWeight.bold, color: Colors.black)
              ),
            ]),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          'Danh mục',
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      createRoute( CategoryDScreen(trieudai: 'Nguyễn',)),
                    );
                  },
                  child: Container(
                      width: (width - 40) / 2 - 10,
                      height: 70,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/Trieu_Nguyen.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Center(
                        child: Text(
                          'Nguyễn',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      createRoute( CategoryDScreen(trieudai: 'Lý',)),
                    );
                  },
                  child: Container(
                      width: (width - 40) / 2 - 10,
                      height: 70,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/Trieu_Ly.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Center(
                        child: Text(
                          'Lý',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      createRoute( CategoryGScreen(gioitinh: "Nam",)),
                    );
                  },
                  child: Container(
                      width: (width - 40) / 2 - 10,
                      height: 70,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/nam.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Center(
                        child: Text(
                          'Nam',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      createRoute( CategoryGScreen(gioitinh: "Nữ",)),
                    );
                  },
                  child: Container(
                      width: (width - 40) / 2 - 10,
                      height: 70,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/nu.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Center(
                        child: Text(
                          'Nữ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )
                  ),
                ),
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
          'Mới',
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
                onTap: () {
                  Navigator.push(
                    context,
                    createRoute( DetailScreen(costumeId: index,)));
                },
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/example-${index}.png'),
                              fit: BoxFit.fitWidth
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
        ),
        Divider(
          color: Colors.grey[300],
          thickness: 1,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Xu hướng',
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
                onTap: () {
                  Navigator.push(
                    context,
                    createRoute( 
                      DetailScreen(costumeId: index,)
                    )
                  );
                },
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/example-${index}.png'),
                              fit: BoxFit.fitWidth
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
        ),
        Divider(
          color: Colors.grey[300],
          thickness: 1,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Dữ liệu Firebase',
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
          child: FirebaseAnimatedList(
            query: db_Ref,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
              Map mesh = snapshot.value as Map;
              return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        createRoute(
                          DetailScreen2(
                              costumeId: mesh["uid"],
                              gender: mesh["Gender"],
                              costumeName: mesh["name"],
                              imageURL: mesh["imageUrl"],
                              decription: mesh["Description"],
                              url: mesh["url"],
                              story: mesh["Story"],
                            ),
                          // TakePictureScreen(camera: widget.camera)
                        ),
                      );
                    },
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(mesh['imageUrl']),
                                  fit: BoxFit.fitWidth
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
                            "Nguyễn",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            mesh['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              );
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget _buildSearchResults() {
    return Container(
      width: double.infinity,
      height: 260,
      child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: _searchResult.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    createRoute( DetailScreen(costumeId: _searchResult[index].costumeId,)));
                },
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(_searchResult[index].imageURL),
                              fit: BoxFit.fitWidth
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
                        _searchResult[index].category.toUpperCase(),
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        _searchResult[index].costumeName,
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