import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    debugDumpRenderTree();
    // TODO: implement build
    return Image.asset('images/splash.jpg');
  }

}