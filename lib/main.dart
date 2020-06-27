//With None License
//Powered by Ricardo2001zg

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';

// 全局变量统一管理
class Global {

}

// 此处为路由实现，处理页面跳转
class BuYuXiYanRoute extends StatefulWidget {
  @override
  _BuYuXiYanRouteState createState() => _BuYuXiYanRouteState();
}

class _BuYuXiYanRouteState extends State<BuYuXiYanRoute> {
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:"/login",
      routes:{
        "/login":(context) => Scaffold(body: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: Container(
            width: 65,
            height: 25,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(6.0),
              color: Color(0xFFe3f2fd),
            ),
            child: FlatButton(child: Text(
                '登陆',
                style: TextStyle(color: Color(0xFF999999),),
              ),
              onPressed: (){Navigator.pushNamed(context, "/main");},
            ),
          ),
        ),),
        "/main":(context) => BuYuXiYanMain(),
      },
    );
  }
}

// 信息输入框动态刷新与保存实现
class BuYuXiYanSendTextField extends StatefulWidget {
  BuYuXiYanSendTextField ({Key key}) : super(key : key);
  @override
  _BuYuXiYanSendTextFieldState createState() =>  _BuYuXiYanSendTextFieldState();
}

class _BuYuXiYanSendTextFieldState extends State<BuYuXiYanSendTextField> {
  TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.text = '基于 Flutter 的消息聚合与即时通讯系统。';
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return TextField(
      decoration: null,
      maxLines: null,
      controller: _controller,
      keyboardType: TextInputType.multiline,
      /*onSubmitted: (String value) async {
        await showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Thanks!'),
              content: Text('You typed "$value".'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {Navigator.pop(context);},
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      },*/
    );
  }
}

// 搜索框动态刷新与保存实现

// 通知栏双ListView切换部分，设计上支持复制至其他程序也可直接调用
// Powered by Ricardo2001zg
class BuYuXiYanDoubleListView extends StatefulWidget {
  BuYuXiYanDoubleListView ({Key key}) : super(key : key);
  @override
  _BuYuXiYanDoubleListViewState createState() =>  _BuYuXiYanDoubleListViewState();
}

// 对信息储存方式的定义
class BuYuXiYanDoubleListViewGlobalTypedef extends Object {
  String listTitle;
  String listDescription;
  Image listImg;
  String listTime;
}

class _BuYuXiYanDoubleListViewState extends State<BuYuXiYanDoubleListView> {
  // 用于持久化存储两个ListView的信息
  List<BuYuXiYanDoubleListViewGlobalTypedef> buYuXiYanList1 = [];
  List<BuYuXiYanDoubleListViewGlobalTypedef> buYuXiYanList2 = [];
  // 以单个节点定义的数据格式进行存储
  void listAdd(String listTitle, String listDescription, Image listImg, String listTime, int whichList, ){
    BuYuXiYanDoubleListViewGlobalTypedef addPoint = new BuYuXiYanDoubleListViewGlobalTypedef();
    addPoint.listTitle = listTitle;
    addPoint.listDescription = listDescription;
    addPoint.listImg = listImg;
    addPoint.listTime = listTime;
    if (whichList == 1){buYuXiYanList1.add(addPoint);
    } else if (whichList == 2){buYuXiYanList2.add(addPoint);}
  }
  // 较多信息一栏单行渲染
  Ink moreInformation (String listTitle, String listDescription, Image listImg, String listTime,){
    return Ink(
      color: Color(0xFFbbdefb),
      child: Text('more'),
    );
  }
  // 较少信息一栏单行渲染
  Ink lessInformation (String listTitle, String listDescription, Image listImg, String listTime,){
    return Ink(
      color: Color(0xFFe3f2fd),
      child: Text('less'),
    );
  }

  Container listReverse(int listReverse) {
    if(listReverse == 1){
      return Container(
          width: double.infinity,
          height: double.infinity,
          child: Row(children: [
            Container(),
          ],),);
    }else if(listReverse == 2){return Container();}
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return listReverse(1);
  }
}
// 通知栏双ListView切换部分结束

// 主界面静态实现，并调用动态控件
class BuYuXiYanMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        /*启用本地化设置，对中文启用支持。*/
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans', countryCode: 'CN'),// Chinese *See Advanced Locales below*
        ],
        title: '不语惜言',
        home:Scaffold(
          /*
          主界面的三个基础Container，将页面划分为左中右三部分。
          最左侧为状态栏，中间为通知栏，右侧为信息栏。
          其中，左侧固定宽度50，中间综合宽度260，右侧随系统填充。
          左侧固定颜色64b5f6(300)。
          */
          body: Row(children: [
            /*状态栏代码*/
            Container(
              width: 50,
              color: Color(0xff64b5f6),
              child: Column(children: [
                /*左侧状态栏，从上到下为头像、消息图标、消息文本、文件图标、文件文本*/
                Container(height: 25,), //空白填充
                Container(
                  height: 32,
                  // 直接使用ClipOval处理成圆形
                  child: ClipOval(
                    // Debug // 使用本地已有图像
                    child: Image.network('http://127.0.0.1/user.jpg'),//头像
                  ),
                ),
                Container(height: 20,), //空白填充
                Container(
                  child: Icon(Icons.message,color: Colors.white,),
                ),
                Container(
                  child: Text(
                    '消息',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color.fromARGB(80, 255, 255, 255)),
                  ),
                ),
                Container(height: 20,), //空白填充
                Container(
                  child: Icon(Icons.folder_open,color: Color.fromARGB(80, 255, 255, 255)),
                ),
                Container(
                  child: Text(
                    '文件',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color.fromARGB(80, 255, 255, 255)),
                  ),
                ),
              ],),
            ),
            /*通知栏代码*/
            Container(
              width: 260,
              child: Column(children: [
                Container(
                  height: 65,
                  color: Color(0xFFbbdefb),
                  child: Column(children: [
                    Container(height: 25,),
                    // 搜索框与添加按钮实现
                    Row(children: [
                      Container(width: 10,), // 空白填充
                      Container(
                        width: 210,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(6.0),
                          color: Color(0x50ffffff),
                        ),
                        child: Row(children: [
                          Container(width: 5,), // 空白填充
                          Container(
                            width: 24,
                            height: 24,
                            child: Icon(Icons.search, color: Color(0xFF999999),),
                          ), // 搜索图标
                          Container(width: 5,), // 空白填充
                          Text(
                            '搜索',
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Color(0xC0999999)),
                          ),
                        ],),//
                      ),
                      Container(width: 5,), // 空白填充
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(6.0),
                          color: Color(0x50ffffff),
                        ),
                        child: Icon(Icons.add, color: Color(0xC0999999),),
                      ),
                    ],),
                  ],),
                ),
                Expanded(child: Text('notice'),),
              ],),
            ),
            /*信息栏代码*/
            Expanded(
              flex: 1,
              child: Container(child: Column(
                children: [
                  /*标题文本定位*/
                  Container(
                    width: double.infinity,
                    height: 65,
                    color: Color(0xFFe3f2fd),
                    child: Column(children: [
                      Container(width:double.infinity,height: 30,),
                      Container(
                        width:double.infinity,
                        child: Row(children: [
                          Container(width: 30,),
                          Container(child: Text(
                            '测试标题',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                            ),
                          ),),
                        ],),
                      ),
                    ],),
                  ),
                  /*信息框*/
                  Expanded(flex:2, child: Container(
                    child: Container(
                      width: double.infinity,
                      /* 使用透明度定义背景进行功能区块的区分 */
                      color: Color(0x46bbdefb),
                      child: Row(children: [
                        Container(width: 30,), // 空白填充
                        Expanded(
                          flex:1,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: Text(
                              'message',
                              textAlign: TextAlign.start,
                              style: TextStyle(color: Color(0xC0999999)),
                            ),
                          ),
                        ),
                      ],),
                    ),
                  ),),
                  /*编辑框*/
                  Expanded(flex:1, child: Container(
                    child: Container(
                      width: double.infinity,
                      /* 使用透明度定义背景进行功能区块的区分 */
                      color: Color(0x1ebbdefb),
                      child: Column(children: [
                        Container(height: 10,), // 空白填充
                        /*功能按钮区*/
                        Container(
                          height: 25,
                          width: double.infinity,
                          child: Row(children: [
                            Container(width: 30,), // 空白填充
                            Icon(Icons.tag_faces, color: Colors.grey,),
                            Container(width: 10,), // 空白填充
                            Icon(Icons.file_upload, color: Colors.grey,),
                            Container(width: 10,), // 空白填充
                            Expanded(flex:1, child: Container(width: double.infinity,),), //空白填充
                            Container(width: 10,), // 空白填充
                            Icon(Icons.local_phone, color: Colors.grey,),
                            Container(width: 15,), // 空白填充
                          ],),
                        ),
                        Container(height: 10,), // 空白填充
                        /*文本输入区*/
                        Expanded(flex: 1,child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: Row(children: [
                            Container(width: 30,), // 空白填充
                            Expanded(
                              flex:1,
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: BuYuXiYanSendTextField(),/*Text(
                                  '基于 Flutter 的消息聚合与即时通讯系统。',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(color: Color(0xC0999999)),
                                ),*/
                              ),
                            ),
                            Container(width: 10,), // 空白填充
                          ],),
                        ),),
                        Container(height: 10,), // 空白填充
                        Container(height: 30,), // 发送按钮占位
                      ],),
                    ),
                  ),),
            ],),),),
          ],),
        ),
    );
  }
}

void main() => runApp(BuYuXiYanRoute());