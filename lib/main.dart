import 'package:flutter/material.dart';
import 'package:fluuter_guide/NewRoute.dart';
import 'package:fluuter_guide/cupertino/CupertinoRoute.dart';
import 'package:fluuter_guide/result/TipRoute.dart';
import 'package:english_words/english_words.dart';
import 'package:fluuter_guide/state/StateRoute.dart';
import 'BaseWidget/BaseWidgetRoute.dart';
import 'Container/ContainerRoute.dart';
import 'LayoutRoute/LayoutRoute.dart';
import 'Tapbox/TapBoxRoute.dart';
import 'imageRoute/ImageRoute.dart';
import 'result/RouterTestRoute.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      //没做routes里注册Navigator.pushName()就回调这个
      onGenerateRoute: (RouteSettings settings){
        return MaterialPageRoute(
          builder: (context){
            String routeNmae = settings.name;
            print("routeName$routeNmae");
            if(routeNmae == "hookTest"){
              return TipRoute(text:"请登录");
            }
            return NewRoute();
          }
        );
      },

      routes: {
        "container_route":(context)=>ContainerRoute(),
        "layout_route":(context)=>LayoutRoute(),
        "Base_route":(context)=>BaseWidgetRoute(),
        "TapBox_route":(context)=>TapBoxRoute(),
        "cupertino_route":(context)=>CupertinoRoute(),
        "state_route":(context)=>StateRoute(),
        "image_page":(context)=>ImageRoute(),
        "new_page":(context)=> NewRoute(),
        "tip_route":(context)=>RouteTestRoute(),
        "tip_route_1":(context)=>TipRoute(text: ModalRoute.of(context).settings.arguments,),
        "/":(context)=>MyHomePage(title: 'Flutter Demo Home Page')
      },
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;
  var wordPair = new WordPair.random();

  void _incrementCounter() {
    setState(() {
      wordPair = new WordPair.random();
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              wordPair.toString(),
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text("open new route"),
              textColor: Colors.blue,
              onPressed: (){
                _skipNewRoute();
              },
            ),
            FlatButton(
              child: Text("open tip route wait result"),
              textColor: Colors.blue,
              onPressed: (){
                _skipTipRoute();
              },
            ),
            FlatButton(
              child: Text("route hook ,没有设置导航name，调用onGenerateRoute"),
              textColor: Colors.blue,
              onPressed: (){
                _skipHookRoute();
              },
            ),
            FlatButton(
              child: Text("to Assets Route"),
              textColor: Colors.blue,
              onPressed: (){
                _skipImageRoute();
              },
            ),
            FlatButton(
              child: Text("get state"),
              textColor: Colors.blue,
              onPressed: (){
                _skipStateRoute();
              },
            ),
            FlatButton(
              child: Text("Cupertino widget page"),
              textColor: Colors.blue,
              onPressed: (){
                _skipCupertinoRoute();
              },
            ),
            FlatButton(
              child: Text("TapBox page"),
              textColor: Colors.blue,
              onPressed: (){
                _skipTapBoxPage();
              },
            ),
            FlatButton(
              child: Text("Base Widget"),
              textColor: Colors.blue,
              onPressed: (){
                _skipBaseRToute();
              },
            ),
            FlatButton(
              child: Text("Layout Route"),
              textColor: Colors.blue,
              onPressed: (){
                _skipLayoutRoute();
              },
            ),
            FlatButton(
              child: Text("Container Route"),
              textColor: Colors.blue,
              onPressed: (){
                _skipContainerRoute();
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _skipNewRoute(){
    Navigator.pushNamed(context, "new_page",arguments:"hi");
  }

  void _skipTipRoute(){
    Navigator.pushNamed(context, "tip_route");
  }

  void _skipHookRoute(){
    Navigator.pushNamed(context, "hookTest");
  }

  void _skipImageRoute(){
    Navigator.pushNamed(context, "image_page");
  }

  void _skipStateRoute(){
    Navigator.pushNamed(context, "state_route");
  }

  void _skipCupertinoRoute(){
    Navigator.pushNamed(context, "cupertino_route");
  }

  void _skipTapBoxPage(){
    Navigator.pushNamed(context, "TapBox_route");
  }

  void _skipBaseRToute(){
    Navigator.pushNamed(context, "Base_route");
  }

  void _skipLayoutRoute(){
    Navigator.pushNamed(context, "layout_route");
  }

  void _skipContainerRoute(){
    Navigator.pushNamed(context, "container_route");
  }


}
