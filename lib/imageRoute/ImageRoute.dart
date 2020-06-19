import 'package:flutter/material.dart';

import 'ImageWidget.dart';

class ImageRoute extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("image route")
      ),
      body: ImageWidget(),
    );
  }

}