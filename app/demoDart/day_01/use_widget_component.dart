import "package:flutter/material.dart";

void main() {
  runApp(new MaterialApp(
    title: "标题",
    home: new TutorialHome(),
  ));
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Scaffold是Material中主要的布局组件
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: "Navigation menu",
          onPressed: null,
        ),
        title: new Text('测试title'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: "Search",
            onPressed: null,
          ),
        ],
      ),
      // body是占屏幕大部分
      body: new Center(
        child: new Text("Hello Dart"),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: "Add",
        child: new Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}