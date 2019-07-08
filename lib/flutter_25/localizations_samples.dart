import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'globalPagesLocalizations.dart';
import 'pageLocalizations.dart';
class LocalizationsSamples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LocalizationsSamplesState();
  }
}

class LocalizationsSamplesState extends State<LocalizationsSamples> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalPagesLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('zh', 'CH'), // Chinese
        // ... 其他语言支持
      ],
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WelcomeState();
  }
}

class WelcomeState extends State<WelcomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Localizations'),
        primary: true,
      ),
      body: Column(
        children: <Widget>[
          // 调用国际化后的属性资源
          Text(PageLocalizations.of(context).taskTitle,)
        ],
      ),
    );
  }
}