import 'package:flutter/material.dart';


class StateRoute extends StatelessWidget{
  static GlobalKey<ScaffoldState> _globalKey= GlobalKey();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
          title:Text("state Route")
      ),
      body: Center(
        child: Builder(builder:(context){
          return RaisedButton(
            child: Text("get state by context"),
            onPressed: (){
              ScaffoldState _state = Scaffold.of(context);
//              ScaffoldState _state1 = context.findAncestorStateOfType<ScaffoldState>();
              _globalKey.currentState.showSnackBar(
                  SnackBar(
                      content:Text("success")
                  )
              );
            },
          );
        },
        )
      )
    );
//        FlatButton(
//        child: Text("get state by context"),
//        onPressed: (){
//          ScaffoldState state = context.findAncestorStateOfType<ScaffoldState>();
//          state.showSnackBar(
//            SnackBar(
//                content:Text("success")
//            )
//          );
//        },
//      ),
  }
  
}