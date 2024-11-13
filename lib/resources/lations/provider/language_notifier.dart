import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/storage.dart';
import '../../app_consts/app_consts.dart';
import '../languages.dart';

final languageProvider = StateNotifierProvider<LanguageNotifier, Locale>((ref) {
  return LanguageNotifier(Locale(StorageUtil().getString(AppConsts.saveLanguage) ?? 'zh'));
});

final languageService = LanguageService();

class LanguageNotifier extends StateNotifier<Locale> {
  LanguageNotifier(super.state);

   // 默认语言

  void setLocale(Locale locale) async {
    state = locale;
    await StorageUtil().setValue(AppConsts.saveLanguage, locale.languageCode);
  }
}