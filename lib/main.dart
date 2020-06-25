//With None License
//Powered by Ricardo2001zg

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';

class AppMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

          body: Row(children: [
            /*
            主界面的三个基础Container，将页面划分为左中右三部分。
            最左侧为状态栏，中间为通知栏，右侧为信息栏。
            其中，左侧固定宽度50，中间综合宽度260，右侧随系统填充。
            左侧固定颜色64b5f6(300)。
            */
            Container(
              width: 50,
              color: Color(0xff64b5f6),
              child: Column(children: [
                /*左侧状态栏，从上到下为头像、消息图标、消息文本、文件图标、文件文本*/
                Container(height: 25,), //空白填充
                Container(
                  height: 32,
                  child: Image.network('http://127.0.0.1/user.jpg'),//头像
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
            Container(
              width: 260,
            ),
            Expanded(child: Container(),flex: 0,),
          ],),
        ),
    );
  }
}

void main() => runApp(AppMain());