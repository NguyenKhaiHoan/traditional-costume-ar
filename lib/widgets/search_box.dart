import '/controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    required this.onSumbit,
    Key? key,
  }) : super(key: key);
  final VoidCallback onSumbit;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: Get.put(SearchController()).searchController,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        isDense: true,                      // Added this
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
      onSubmitted: (a) => onSumbit(),
    );
  }
}