import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:propertodolist/list_tab.dart';

import 'constants.dart';
import 'other_tab.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomeState();
  
}

class _HomeState extends State<HomePage>{

  int _currentIndex = 0;
  ListTab _listTab = new ListTab();

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('DoBeDoBeDo'),
      ),
      body: SafeArea(
        right: false,
        child: IndexedStack(
          index: _currentIndex,
          children: [_listTab,otherTab()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: mainColor,
        selectedItemColor: selectedColor,
        unselectedItemColor: unselectedColor,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: tabItem,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _listTab.dispose();
  }

}