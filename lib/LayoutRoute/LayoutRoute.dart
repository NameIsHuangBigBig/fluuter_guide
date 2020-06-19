import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutRoute extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("layout Route"),
      ),
      body: SingleChildScrollView(
        child: Wrap(
          children: <Widget>[
            RowWidget(),
            ColumnWidget(),
            FlexWidget(),
            WrapWidget(),
            FlowWidget(),
            StackWidget(),
            AlignWidget()
          ],
        ),
      ),
    );
  }
}

//RowWidget
class RowWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          color: Colors.grey[600],
          child:Row(
            mainAxisSize: MainAxisSize.min, // 最小长度
            textDirection: TextDirection.rtl, //字体从右到左
            children: <Widget>[
              Text("hello word"),
              Text("HELLO WORD",style: TextStyle(fontSize: 20,color: Colors.blue),)
            ],
          ) ,
        ),
        Container(
          color: Colors.green[600],
          child:Row(
            mainAxisSize: MainAxisSize.max, // 最大长度
            mainAxisAlignment: MainAxisAlignment.spaceAround,//元素排练方式
            crossAxisAlignment: CrossAxisAlignment.center,//参考VerticalDirection来设置纵轴对齐方式
            children: <Widget>[
              Text("hello word"),
              Text("HELLO WORD",style: TextStyle(fontSize: 25,color: Colors.blue),)
            ],
          ) ,
        ),
        Container(
          color: Colors.blue[600],
          child:Row(
            crossAxisAlignment: CrossAxisAlignment.start, //参考VerticalDirection来设置纵轴对齐方向
            verticalDirection: VerticalDirection.up,//纵轴对齐是底部，垂直对齐最上面，绘制在上面
            children: <Widget>[
              Text("hello word"),
              Text("HELLO WORD",style: TextStyle(fontSize: 35,color: Colors.blue),)
            ],
          ) ,
        ),
      ],
    );
  }

}

//ColumnWidget
class ColumnWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.red[600],
      child:Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.amber[200],
              child: Column(
                children: <Widget>[
                  Text("column 嵌套column 通过expand来扩大")
                ],
              ),
            ),
          ),
        ],
      ) ,
    );
  }

}

//FlexWidget
class FlexWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.black12,
      height: 500,
      child: Column(
        children: <Widget>[
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.red,
                  height: 30,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.green,
                  height: 30,
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 60,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30,
                    color: Colors.green,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 100,
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.red,
                    height: 30,
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30,
                    color: Colors.green,
                  ),
                )
              ],
            ),
          )
        ],
      ),

    );
  }

}
//WrapWidget
class WrapWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 500,
      color: Colors.amber,
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 50, //横间隔
        runSpacing: 80,//竖间隔
        children: <Widget>[
          Text("Wrap Widget"*4,style: TextStyle(fontSize: 32),),
          Text("Wrap Widget")
        ],
      ),
    );
  }

}

//FlowWidget
class FlowWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Flow(
      delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
      children: <Widget>[
        new Container(width: 80.0, height:80.0, color: Colors.red,),
        new Container(width: 80.0, height:80.0, color: Colors.green,),
        new Container(width: 80.0, height:80.0, color: Colors.blue,),
        new Container(width: 80.0, height:80.0,  color: Colors.yellow,),
        new Container(width: 80.0, height:80.0, color: Colors.brown,),
        new Container(width: 80.0, height:80.0,  color: Colors.purple,),
      ],
    );
  }

}

class TestFlowDelegate extends FlowDelegate{

  TestFlowDelegate({this.margin});
  EdgeInsets margin;
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    for(int i =0;i<context.childCount;i++){
        var w = context.getChildSize(i).width+x+margin.right; //已使用宽度
        if(w<context.size.width){ // 不换行
          context.paintChild(i,transform: Matrix4.translationValues(x, y, 0));
          x=w+margin.left;
        } else{
          //换行
          x=margin.left;
          y+=context.getChildSize(i).height+margin.top+margin.bottom;
          context.paintChild(i,transform: Matrix4.translationValues(x, y, 0));
          x += context.getChildSize(i).width+margin.left+margin.right;
        }
    }
  }

  @override
  getSize(BoxConstraints constraints){
    //指定Flow的大小
    return Size(double.infinity,200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate!=this;
  }

}

//StackWidget
class StackWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.green,
      height: 500,
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          fit: StackFit.expand, //未定位widget占满Stack整个空间
          alignment:  Alignment.center,
          children: <Widget>[
            Text("hhh"),
            Positioned(
              left: 10,
              top: 50,
              child: RaisedButton(
                child: Text("Stack layout"),
              ),
            )
          ],
        ),

      ),
    );
  }

}


class AlignWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context){
      return  Column(
          children: <Widget>[
            Container(
              height: 300,
              color: Colors.blue,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            ),
            Container(
              height: 300,
              width: 100,
              color: Colors.red,
              child: Align(
                alignment: Alignment(1.0,0),
                //实际出来坐标 (Alignment.x*childWidth/2+childWidth/2, Alignment.y*childHeight/2+childHeight/2)
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            )
          ],
        );

  }
}