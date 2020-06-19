import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TapBoxRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("TapBox"),
      ),
      child: Center(
        child: Wrap(

          children: <Widget>[
            TapBoxA(),
            ParentWidget(),
            ParentWidgetC()
          ],
        ),
      ),
    );
  }

}

//自己控制state
class TapBoxA extends StatefulWidget{

  TapBoxA({Key key}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TapState();
  }

}
class TapState extends State<TapBoxA>{

  bool _active = true;

  void _handleTap(){
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 200,
        height: 200,
        child: Center(

          child: Text("TapBox A",
            style: TextStyle(
                fontSize: 32.0, color: Colors.white
            )),
        ),
        decoration: BoxDecoration(
          color:_active? Colors.red[800]:Colors.grey[600]
        ),
      ),
    );
  }
}

//parent控制state
class ParentWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ParentState();
  }

}

class ParentState extends State<ParentWidget>{

  bool _active = false;

  void _handlerChange(bool newValue){
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: TapBoxB(active:_active,onChange: _handlerChange),
    );
  }

}

class TapBoxB extends StatelessWidget{

  TapBoxB({Key key,this.active:false,@required this.onChange}):super(key:key);
  final bool active;
  final ValueChanged<bool> onChange;

  void _handleChange(){
    onChange(!active);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: _handleChange,
      child: Container(
        width: 200,
        height: 200,
        child: Center(
          child: Text("TapBox B",style: TextStyle(fontSize: 32.0,color: Colors.white),),
        ),
        decoration: BoxDecoration(
          color: active? Colors.red[800]:Colors.grey[600]
        ),
      ),
    );
  }
}

//TapBoxC ，父类和自己都控制state
class ParentWidgetC extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ParentStateC();
  }

}
class ParentStateC extends State<ParentWidgetC>{

  bool active = false;

  void _handleState(bool newValue){
    setState(() {
      active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TapBoxC(active: active,onChange: _handleState);
  }

}

class TapBoxC extends StatefulWidget{

  TapBoxC({Key key,this.active:false,@required this.onChange}):super(key:key);

  final bool active;
  final ValueChanged<bool> onChange;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TapBoxStateC();
  }

}

class TapBoxStateC extends State<TapBoxC>{

  bool hightLight = false;

  void _handleTap(){
    widget.onChange(!widget.active);
  }

  void _handleTapDown(TapDownDetails tapDownDetails){
    setState(() {
      hightLight = true;
    });
  }

  void _handleUp(TapUpDetails tapDownDetails){
    setState(() {
      hightLight = false;
    });

  }

  void _handleTapCancel(){
    setState(() {
      hightLight = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: _handleTap,
      onTapDown: _handleTapDown,
      onTapCancel: _handleTapCancel,
      onTapUp: _handleUp,
      child: Container(
        decoration: BoxDecoration(
          color: widget.active? Colors.red[800] : Colors.grey[600],
          border: hightLight? Border.all(
            color: Colors.amber,width: 5
          ):null
        ),
        child: Center(
          child: Text("TapBoxC",style: TextStyle(fontSize: 32.0,color: Colors.white),),
        ),
        width: 200,
        height: 200,
      ),
    );
  }

}