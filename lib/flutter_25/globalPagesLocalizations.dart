import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'pageLocalizations.dart';

class GlobalPagesLocalizations
    extends LocalizationsDelegate<PageLocalizations> {
  const GlobalPagesLocalizations();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<PageLocalizations> load(Locale locale) {
    return new SynchronousFuture<PageLocalizations>(
        new PageLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<PageLocalizations> old) {
    return false;
  }

  static GlobalPagesLocalizations delegate = const GlobalPagesLocalizations();
}