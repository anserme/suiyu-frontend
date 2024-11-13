import 'package:fpbrowser/resources/app_assets/app_image_assets.dart';

class AppConsts {
  static const String saveUserInfo = "saveUserInfo";
  static const String saveTheme = 'saveTheme';
  static const String saveLanguage = 'saveLanguage';
  static List<String> icons = [
    AppImageAssets.iconOpenWindow,
    AppImageAssets.iconClone,
    AppImageAssets.iconSort,
    AppImageAssets.iconCommonWindow,
    AppImageAssets.iconBathImport,
    AppImageAssets.iconBathBackupCopy,
    AppImageAssets.iconBathImport,
    AppImageAssets.iconBathModify,
    AppImageAssets.iconBathClose,
    AppImageAssets.iconBathReboot,
    AppImageAssets.iconShareWindow,
    AppImageAssets.iconRemoveWindow,
    AppImageAssets.iconCleanWindow,
    AppImageAssets.iconDeleteWindow,
  ];
  static List<String> modity = [
    "打开选中窗口",
    "克隆指定窗口",
    "一键随机自定义排序",
    "将选中窗口设为常用",
    "批量导出窗口",
    "批量备份Cookie",
    "批量导出Cookie",
    "批量修改窗口",
    "批量关闭窗口",
    "批量重启窗口",
    "分享选中窗口与他人共用",
    "转移选中窗口给他人",
    "清空窗口缓存",
    "删除选中窗口"
  ];
}
