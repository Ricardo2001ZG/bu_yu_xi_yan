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
        home:Text('1'),
    );
  }
}

void main() {runApp(AppMain());}