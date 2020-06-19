import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ContainerRoute extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Container Route"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
           DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
             child: Container(height: 100,width: 50,),
              ),

            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: double.infinity,
                maxHeight: 50
              ),
              child: Container(
                color:Colors.red
              ),
            ),

            SizedBox(
              width: 50,
              height: 50,
              child: Container(
                color: Colors.green,
              ),
            ),

            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 100,
                minHeight: 100
              ),
              child: UnconstrainedBox(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 50,
                    minWidth: 50
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.yellow),
                  ),
                ),
              ),
            ),

            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.red,Colors.orange[700]]),
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [BoxShadow(
                  color: Colors.black,
                  offset: Offset(10,10),
                  blurRadius: 4.0
                )]
              ),
              child: Container(
                width: 50,
                height: 50,

              ),
            ),

            Container(
              width: 100,
              height: 25,
              margin: EdgeInsets.only(top: 30),
              color: Colors.black,
              child: Transform(
                alignment: Alignment.topRight,
                transform: Matrix4.skewY(0.3),//沿Y轴倾斜0.3弧度
                child: Container(
                  color: Colors.deepOrange,
                  child:Text("Transform") ,
                ),
              ),
            ),

            Container(
              width: 100,
              height: 25,
              margin: EdgeInsets.only(top: 30),
              color: Colors.black,
              child: Transform.translate(
               offset: Offset(-20,-5),
                child: Container(
                  color: Colors.deepOrange,
                  child:Text("Transform") ,
                ),
              ),
            ),

            Container(
              width: 100,
              height: 25,
              margin: EdgeInsets.only(top: 30),
              color: Colors.black,
              child: Transform.rotate(
                angle: math.pi/2,
                child: Container(
                  color: Colors.deepOrange,
                  child:Text("Transform") ,
                ),
              ),
            ),

            Container(
              width: 100,
              height: 25,
              margin: EdgeInsets.only(top: 100),
              color: Colors.deepOrange,
              child: Transform.scale(
                scale: 1.5,
                child: Container(

                  child:Text("Transform") ,
                ),
              ),
            ),

      Container(
        constraints: BoxConstraints.tightFor(width:200,height: 150),
        decoration: BoxDecoration(

          gradient: RadialGradient(
              colors: [Colors.red,Colors.orange],
              center: Alignment.topLeft,
              radius: .98
          ),boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1.0,2.0)
            )],
        ),
      )

          ],
        ),
      ),
    );
      DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
    );
  }

}