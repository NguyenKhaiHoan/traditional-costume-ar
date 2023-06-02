import '/models/costume.dart';
import '/screens/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class CategoryGScreen extends StatefulWidget {
  final String gioitinh;
  const CategoryGScreen({Key? key, required this.gioitinh}) : super(key: key);

  @override
  State<CategoryGScreen> createState() => _CategoryGScreenState();
}

class _CategoryGScreenState extends State<CategoryGScreen> {

  late String gioitinh;

  @override
  void initState() {
    super.initState();
    gioitinh = widget.gioitinh;
  }

  Iterable<Costume> get gioitinhList {
    return Costume.costumeList
      .where((costume) => costume.gender == gioitinh)
      .map((e) => Costume(
            costumeId: e.costumeId,
            costumeName: e.costumeName,
            category: e.category,
            gender: e.gender,
            imageURL: e.imageURL,
            images: e.images,
            decription: e.decription,
          ));
  }

  TextEditingController controller = TextEditingController();
  List<Costume> _searchResult = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Expanded(
              child: TextField(
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: _buildBody(),
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

    gioitinhList.forEach((costume) {
      if (costume.costumeName.toLowerCase().contains(text)) _searchResult.add(costume);
    });

    setState(() {});
  }

  Widget _buildBody() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: _searchResult.length != 0 || controller.text.isNotEmpty
                ? Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    _buildSearchResults()
                  ],
                )
                : _partBody()),
        ],
      );
  }

  Widget _partBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
        ),
        Text(
          widget.gioitinh,
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
          itemCount: gioitinhList.length,
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        gioitinhList.elementAt(index).imageURL,
                        fit: BoxFit.cover,
                        height: 160,
                        width: 160,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      gioitinhList.elementAt(index).category.toUpperCase(),
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      gioitinhList.elementAt(index).costumeName,
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
                    createRoute( DetailScreen(costumeId: index,)));
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
