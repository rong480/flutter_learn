import "package:flutter/material.dart";

class MyAppBar extends StatelessWidget {
  MyAppBar({this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 128.0, // 单位是逻辑上的像素（而不是真实的像素）
      padding: const EdgeInsets.symmetric(horizontal: 8.0,),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      // Row 是水平方向的线性布局（linear layout）
      child: new Row(
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
            tooltip: "Navigation menu",
            onPressed: null,
          ),
          new Expanded(
            child: title,
          ),
          new IconButton(
              icon: new Icon(Icons.search),
              tooltip: "search",
              onPressed: null
          ),
        ],
      ),
    );
  }
}
class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Material 是UI呈现的一张纸
    return new Material(
      // Column 是垂直方向的线性布局
      child: new Column(
        children: <Widget>[
          new MyAppBar(
            title: new Text(
              "测试标题",
              style: Theme.of(context).primaryTextTheme.title,
            ),
          ),
          new Expanded(
              child: new Center(
                  child: new Text("hello center text")
              )
          )
        ],
      ),
    );
  }
}

void main() {
  runApp(new MaterialApp(
    title: "My App",
    home: new MyScaffold(),
  ));
}
