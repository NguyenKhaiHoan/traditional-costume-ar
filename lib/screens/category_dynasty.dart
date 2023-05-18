import '/controller/search_controller.dart';
import '/models/costume.dart';
import '/screens/detail.dart';
import '/widgets/search_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class CategoryDScreen extends StatefulWidget {
  final String trieudai;
  const CategoryDScreen({Key? key, required this.trieudai}) : super(key: key);

  @override
  State<CategoryDScreen> createState() => _CategoryDScreenState();
}

class _CategoryDScreenState extends State<CategoryDScreen> {
  @override
  Widget build(BuildContext context) {
    Iterable<Costume> trieudaiList = Costume.costumeList.where((costume) => costume.category == widget.trieudai).map((e) => Costume(costumeId: e.costumeId, costumeName: e.costumeName, category: e.category, gender: e.gender, imageURL: e.imageURL, images: e.images, decription: e.decription, ));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Expanded(
              child: TextField(
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
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  hintText: "Search...",
                  filled: true,
                  fillColor: Colors.black12.withOpacity(0.1),
                ),
              )
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 15,
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(IconlyLight.arrow_left_2, color: Colors.black,),
            ),
          ],
        ),
        leadingWidth: 39,
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  widget.trieudai,
                  style: TextStyle(
                    fontSize: 26,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                MasonryGridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 23,
                  itemCount: trieudaiList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute( builder: ((context) => DetailScreen(costumeId: index,))));
                      },
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                trieudaiList.elementAt(index).imageURL,
                                fit: BoxFit.cover,
                                height: 160,
                                width: 160,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              trieudaiList.elementAt(index).category.toUpperCase(),
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              trieudaiList.elementAt(index).costumeName,
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
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          )
      ),
    );
  }
}
