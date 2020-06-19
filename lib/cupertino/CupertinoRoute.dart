import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoRoute extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cupertino"),
      ),
      child: Center(
        child: CupertinoButton(
          color: CupertinoColors.activeBlue,
          child: Text("Cupertion Button"),
          onPressed: (){
            
          },
        ),
      ),
    );
  }

}