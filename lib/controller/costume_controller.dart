import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/models/costume.dart';

class CostumeController extends GetxController {
  var favoriteCostume = <Costume>[].obs;

  bool isInWatchList(Costume costume) {
    return favoriteCostume.any((c) => c.costumeId == costume.costumeId);
  }

  void addToWatchList(Costume costume) {
    if (favoriteCostume.any((c) => c.costumeId == costume.costumeId)) {
      favoriteCostume.remove(costume);
    } else {
      favoriteCostume.add(costume);
    }
  }
}