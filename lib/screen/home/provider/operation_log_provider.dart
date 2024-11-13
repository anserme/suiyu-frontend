import 'package:flutter/foundation.dart' show immutable;
import 'package:fpbrowser/resources/app_assets/app_image_assets.dart';
import 'package:riverpod/riverpod.dart';

import '../../../resources/lations/languages.dart';

@immutable
class OperationLogSelect {
  const OperationLogSelect( {
    required this.name,
    required this.id,
    required this.isSelect,
  });

  final String name;
  final int id;
  final bool isSelect;
}

class OperationLogSelectList extends Notifier<List<OperationLogSelect>> {

  @override
  List<OperationLogSelect> build() => [
    const OperationLogSelect(name: "登录日志", id: 0, isSelect: false),
    const OperationLogSelect(name: "登录日志", id: 1, isSelect: true),
    const OperationLogSelect(name: "云手机账单", id: 2, isSelect: false),
  ];

  void selectItem({required int  id}) {
    state = [
      for (final menu in state)
        if (menu.id == id)
          OperationLogSelect(
              id: menu.id,
              name: menu.name,
              isSelect: !menu.isSelect,
          )
        else
          OperationLogSelect(
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
