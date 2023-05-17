import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
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
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Text(
                  'Hủy'
              )
            ),
          ],
        ),
        leadingWidth: 0,
      ),
      body: SingleChildScrollView(
        child: Column(

        ),
      ),
    );
  }
}
