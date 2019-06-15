import 'package:flutter/widgets.dart';

class PageLocalizations {
  final Locale locale;
  PageLocalizations(this.locale);

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'task title': 'Flutter Demo',
      'titlebar title': 'Flutter Demo Home Page',
      'click tip': 'You have pushed the button this many times:',
      'inc': 'Increment'
    },
    'zh': {
      'task title': 'Flutter 示例',
      'titlebar title': 'Flutter 示例主页面',
      'click tip': '你一共点击了这么多次按钮：',
      'inc': '增加'
    }
  };

  get taskTitle {
    return _localizedValues[locale.languageCode]['task title'];
  }

  get titleBarTitle {
    return _localizedValues[locale.languageCode]['titlebar title'];
  }

  get clickTop {
    return _localizedValues[locale.languageCode]['click tip'];
  }

  get inc {
    return _localizedValues[locale.languageCode]['inc'];
  }

  static PageLocalizations of(BuildContext context) {
    return Localizations.of(context, PageLocalizations);
  }
}