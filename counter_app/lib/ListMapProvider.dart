import 'package:flutter/material.dart';

class Listmapprovider extends ChangeNotifier {
  List<Map<String, dynamic>> _mData = [];

  getData() => _mData;
  addData(Map<String, dynamic> data) {
    _mData.add(data);
    notifyListeners();
  }


}
