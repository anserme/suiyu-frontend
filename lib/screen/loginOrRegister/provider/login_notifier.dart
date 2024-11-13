import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpbrowser/model/user_info_save_model.dart';
import 'package:go_router/go_router.dart';

import '../../../resources/app_consts/app_consts.dart';
import '../../../utils/storage.dart';
import '../entity/login_state.dart';

// 登录状态管理器

class LoginNotifier extends Notifier<Map<String, dynamic>> {
  @override
  Map<String, dynamic> build() => loadUserInfo();

  Map<String, dynamic> loadUserInfo()  {
    var map = StorageUtil().getJSON(AppConsts.saveUserInfo);
    return map ?? {}; // 防止返回 null
  }

  Future<void> login(BuildContext mContext, String username, String password, bool rememberPassword, String code) async {
    print("获取的用户名：$username,, 密码：$password,,,,记住密码： $rememberPassword,,,,code: $code");

    if (rememberPassword) {
      var userInfo = UserInfo(
          username: username,
          password: password,
          rememberPassword: rememberPassword);
      await StorageUtil().setJSON(AppConsts.saveUserInfo, userInfo.toJson());
    }
    mContext.go("/home"); // 跳转到首页
  }
}