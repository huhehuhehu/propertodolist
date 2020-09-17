import 'dart:convert';

import 'package:flutter/material.dart';

final LineSplitter ls = new LineSplitter();

var mainColor = Colors.deepPurple;
var selectedColor = Colors.white;
var unselectedColor = Colors.black;

List<String> tabText = ['Quicknotes', 'Kwasun'];
List<BottomNavigationBarItem> tabItem = [
  BottomNavigationBarItem(
    icon: new Icon(Icons.assignment),
    title: new Text(tabText[0]),
  ),
  BottomNavigationBarItem(
    icon: new Icon(Icons.accessible_forward),
    title: new Text(tabText[1]),
  ),
];

final String tableName = "quick_notes";
final String Column_id = "id";
final String Column_name = "content";
