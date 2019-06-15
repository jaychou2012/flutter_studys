import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_samples/generated/i18n.dart';

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
        S.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English
        const Locale('zh', 'CN'), // Chinese
        const Locale("zh", "HK"),
        // ... 其他语言支持
      ],
      localeResolutionCallback:
          S.delegate.resolution(fallback: const Locale('en', '')),
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
          title: Text(S.of(context).title),
          primary: true,
        ),
        body: Column(
          children: <Widget>[
            // 调用国际化后的属性资源
            Text(
              S.of(context).title,
            ),
            RaisedButton(
                child: Text(
                  S.of(context).title,
                ),
                onPressed: () {
                  FlutterI18n.refresh(context, Locale('en', ''));
                })
          ],
        ));
  }
}
