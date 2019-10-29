import "package:flutter/material.dart";

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "我是title",
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(
          title: '这是首页'
      ),
    );
  }
}

class TipRoute extends StatelessWidget {
  TipRoute({
    Key key,
    @required this.text, // 接受一个text参数
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('提示'),
      ),
      body: Padding(

      )
    )
  }
}



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key,this.title}) :super(key: key);
  final String title;

  @override
  _MyHomePageState createState()=> new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('你点击底部按钮次数'),
              new Text(
                '$_counter',
                style: Theme.of(context).textTheme.display1,
              ),
              FlatButton(
                child: Text("open new route"),
                textColor: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) {
                          return NewRoute();
                        },
                        maintainState: true, // 是否跳转路由后，原有路由还保存
                        fullscreenDialog: false // 对应是否实现的是全屏的模态对话框
                    ),
                  );
                },
              ),
            ],
          )
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        tooltip: 'Increment',
        onPressed: _incrementCounter,
      ),
    );
  }
}

class NewRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("this is new router page"),
      ),
    );
  }
}



