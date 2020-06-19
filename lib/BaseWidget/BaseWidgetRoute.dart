import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BaseWidgetRoute extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle:Text("Base widget"),
      ),
      resizeToAvoidBottomInset: true,
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top:44.0 + MediaQuery.of(context).padding.top),
        child: Container(
          padding: EdgeInsets.only(bottom: 50),
          child: Wrap(
            children: <Widget>[
              TextWidget(),
              ButtonWidget(),
              ImageWidget(),
              SwitchCheckBox(),
              TextFieldWidget(),
              FormWidget(),
              ProgressWidget()
            ],
          ),
        ),
      ),
    );
  }
}


//Text
class TextWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
        children: <Widget>[
          Text(
          "Hello word"*6,
            overflow: TextOverflow.ellipsis,
            textScaleFactor: 1.2,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 16.0,
                background: Paint()..color=Colors.grey,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dotted
            ),
          ),
          Text.rich(TextSpan(
            style: TextStyle(decoration: TextDecoration.underline ),
            children:[
              TextSpan(text: "https://"),
              TextSpan(
                  text: "www.baidu.com",
                  style: TextStyle(fontSize: 14,color: Colors.blue),
              )
            ]
          )),
          DefaultTextStyle(
            style: TextStyle(
              fontSize: 12,
              color: Colors.amber
            ),
            child: Column(
              children: <Widget>[
                Text("default Text"),
                Text("default Text"),
                Text("style Text",style: TextStyle(color: Colors.black),)
              ],
            ),
          )
        ],
        );
  }
}


//Button
class ButtonWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child:Column(
        children: <Widget>[
          RaisedButton(
            child:Text("RaisedButton"),
            onPressed: (){},
          ),
          FlatButton(
            child: Text("FlatButton"),
            onPressed: (){},
          ),
          OutlineButton(
            child: Text("OutLineButton"),
            onPressed: (){},
          ),
          Material(
            child: IconButton(
              icon: Icon(Icons.access_alarm),
              onPressed: (){},
            ),
          ),
          RaisedButton.icon(
            icon: Icon(Icons.ac_unit),
            label:Text("RaisedButton.icon"),
            onPressed: (){},
          ),
          FlatButton.icon(
            icon: Icon(Icons.accessibility),
            label:Text("FlatButton.icon"),
            onPressed: (){},
          ),
          OutlineButton.icon(
            icon: Icon(Icons.settings),
            label:Text("OutlineButton.icon"),
            onPressed: (){},
          ),
          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("FlatButton customize"),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),
            onPressed: (){},
          ),
          RaisedButton.icon(
              onPressed: (){},
              icon: Icon(Icons.label),
              label: Text("RaiseButton.icon customize"),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(5))),
          )
        ],
      ) ,
    );
  }

}

//Image
class ImageWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child:Column(
          children: <Widget>[
            Image.asset("images/splash.jpg",width: 80,height: 80,),
            Image(
              image: AssetImage("images/splash.jpg"),
              width: 80,height: 80,
              color: Colors.blue,
              colorBlendMode: BlendMode.colorBurn,
            ),
            Image(
              width: 80,
              height: 80,
              image: NetworkImage("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1586348961979&di=39649f73e80125fa4f07d79cac9e8684&imgtype=0&src=http%3A%2F%2Fa4.att.hudong.com%2F21%2F09%2F01200000026352136359091694357.jpg"),
            )
          ],
        )
    );
  }

}

//SwitchBox
class SwitchCheckBox extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SwitchCheckBoxState();
  }
}

class SwitchCheckBoxState extends State<SwitchCheckBox>{

  bool _switchState = false;
  bool _checkState = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: Center(
        child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Switch(
              value: _switchState,
              onChanged: (value){
                setState(() {
                  _switchState = value;
                });
              },
            ),
            Checkbox(
              value: _checkState,
              onChanged: (value){
                setState(() {
                  _checkState = value;
                });
              },
            )
          ],
        ) ,
      ),
    );
  }
}

//TextField
class TextFieldWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TextFieldState();
  }

}
class TextFieldState extends State<TextFieldWidget>{

  TextEditingController _account = TextEditingController();
  TextEditingController _password = TextEditingController();

  FocusNode _accountFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();

  FocusScopeNode _focusScopeNode;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child:Column(
        children: <Widget>[
          TextField(
            controller: _account,
            autofocus: true,
            focusNode: _accountFocus,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                hintText: "请输入用户名",
                labelText: "用户名",
              suffixIcon: GestureDetector(child: Icon(Icons.clear),onTap: (){_account.clear();},),
              prefixIcon: Icon(Icons.label),
              icon: Icon(Icons.accessibility),
            ),
          ),
          TextField(
            focusNode: _passwordFocus,
            controller: _password,
            obscureText: true,
            onChanged: (value){
              print(value);
            },
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
              hintText: "请输入密码",
              suffixIcon: GestureDetector(child: Icon(Icons.remove_red_eye),onTap: (){Fluttertoast.showToast(msg: _password.text);},)
            ),
          ),
          RaisedButton.icon(onPressed: (){
            if(null == _focusScopeNode){
              _focusScopeNode = FocusScope.of(context);
            }
            if(_focusScopeNode.focusedChild==_passwordFocus){
              _focusScopeNode.requestFocus(_accountFocus);
            }else{
              _focusScopeNode.requestFocus(_passwordFocus);
            }

          }, icon: Icon(Icons.track_changes), label: Text("切换焦点")),
          RaisedButton(
            child: Text("关闭键盘"),
            onPressed: (){
              _focusScopeNode.unfocus();
            },
          ),
          Theme(
            data: Theme.of(context).copyWith(
              hintColor: Colors.grey,
              inputDecorationTheme:InputDecorationTheme(
                labelStyle: TextStyle(fontSize: 12,color: Colors.grey)
              )
            ),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Theame label",
                      hintText: "Theame TextField"
                  ),
                )
              ],
            ),
          )
        ],
      ) ,

    );
  }

}

//FormWidget
class FormWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormState1();
  }

}

class FormState1 extends State<FormWidget>{
  GlobalKey _formKey= new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child:Center(
       child:Form(
          child: Builder(builder: (context){
            return Form(
              key: _formKey,
              autovalidate: true,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "输入用户名",
                        labelText: "用户名",
                        focusColor: Colors.red,
                        prefixIcon: Icon(Icons.person_outline)
                    ),
                    validator: (value){
                      return value.trim().length>0? null: "用户名不能为空";
                    },
                  ),
                  TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "输入密码",
                          labelText: "密码",
                          focusColor: Colors.red,
                          prefixIcon: Icon(Icons.lock)
                      ),
                      validator: (value){
                        return value.trim().length<5? "密码长度不够":null;
                      }
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            child: Text("登陆",style: TextStyle(color:Colors.white),),
                            color: Colors.blue,
                            onPressed: () {
                              if(Form.of(context).validate()){//当父widget为Form时可以这样使用

//                          }
//                          if((_formKey.currentState as FormState).validate()){
                                Fluttertoast.showToast(msg: "登陆成功");
                              }else{
                                Fluttertoast.showToast(msg: "登陆失败");
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
      }),
       )
        ,
      ) ,
    );
  }

}

//ProgressWidget
class ProgressWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProgressState();
  }

}

class ProgressState extends State<ProgressWidget> with SingleTickerProviderStateMixin{

  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this,
      duration: Duration(seconds: 10)
    );
    _animationController.forward();
    _animationController.addListener((){

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child:  LinearProgressIndicator(
//              value: .5,//为空就无限循环
              backgroundColor: Colors.grey[600],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child:  LinearProgressIndicator(
              value: .5,//为空就无限循环
              backgroundColor: Colors.grey[600],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child:  CircularProgressIndicator(
//              value: .5,//为空就无限循环
              backgroundColor: Colors.grey[600],
              semanticsLabel: "进度条",
              strokeWidth: 10,
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: SizedBox(
              width: 200,
              height: 10,
              child: LinearProgressIndicator(
                valueColor: ColorTween(begin:Colors.green,end: Colors.red).animate(_animationController),
                backgroundColor: Colors.grey,
              ),
            ),
          )

        ],
      ),
    );
  }

}