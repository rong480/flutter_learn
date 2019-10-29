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
            padding: EdgeInsets.all(18),
            child: Column(
                children: <Widget>[
                  Text(text),
                  RaisedButton(
                      onPressed: () => Navigator.pop(context, '我是返回值'),
                      child: Text("返回")
                  )
                ]
            )
        )
    );
  }
}

class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: RaisedButton(
          onPressed: () async{
            var result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return TipRoute(
                        text: '我是传过来的text'
                    );
                  },
                )
            );

            print("路由返回值：$result");
          },

          child: Text("打开提示页"),
        )
    );
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
                          return RouterTestRoute();
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




