import 'package:flutter/material.dart';
import 'package:fluuter_guide/result/TipRoute.dart';

class RouteTestRoute extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Tip Route result"),
      ),
      body:Center(
        child: RaisedButton(
          onPressed: ()async{
            var result = await Navigator.push(context,
                MaterialPageRoute(
                    builder: (context){
                      return TipRoute(
                        text: "我是提示XXX",
                      ) ;
                    }
                )
            );
            print("路由返回值￥$result");
          },
          child: Text("打开提示页"),
        ),
      )
    );
  }

}
