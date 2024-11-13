import 'package:flutter/foundation.dart' show immutable;
import 'package:fpbrowser/resources/app_assets/app_image_assets.dart';
import 'package:riverpod/riverpod.dart';

import '../../../resources/lations/languages.dart';

@immutable
class BrowserWindowSelect {
  const BrowserWindowSelect( {
    required this.name,
    required this.id,
    required this.isSelect,
  });

  final String name;
  final int id;
  final bool isSelect;
}

class BrowserWindowSelectList extends Notifier<List<BrowserWindowSelect>> {

  @override
  List<BrowserWindowSelect> build() => [
    const BrowserWindowSelect(name: "全部", id: 0, isSelect: true),
    const BrowserWindowSelect(name: "自建", id: 1, isSelect: false),
    const BrowserWindowSelect(name: "常用", id: 2, isSelect: false),
    const BrowserWindowSelect(name: "已打开(0)", id: 3, isSelect: false),
    const BrowserWindowSelect(name: "分享", id: 4, isSelect: false),
    const BrowserWindowSelect(name: "转移", id: 5, isSelect: false),
  ];

  void selectItem({required int  id}) {
    state = [
      for (final menu in state)
        if (menu.id == id)
          BrowserWindowSelect(
              id: menu.id,
              name: menu.name,
              isSelect: !menu.isSelect,
          )
        else
          BrowserWindowSelect(
            id: menu.id,
            name: menu.name,
            isSelect: false,
          )
    ];
  }

  final languageService = LanguageService();
   LanguageService language() {
     return languageService;
   }
}
