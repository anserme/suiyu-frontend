import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpbrowser/resources/app_colors/app_colors.dart';
import 'package:fpbrowser/resources/lations/provider/language_notifier.dart';
import 'package:fpbrowser/resources/app_routing/app_router.dart';
import 'package:fpbrowser/utils/storage.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtil.init();
  await windowManager.ensureInitialized();
  WindowOptions windowOptions = const WindowOptions(
    //窗口是否居中
    center: true,
    //hidden 表示隐藏标题栏 normal 窗体标题栏
    titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    //显示窗口
    await windowManager.show();
    //聚焦窗口
    await windowManager.focus();
    windowManager.setResizable(false);
    //设置窗口模式：亮色模式和暗色模式
    windowManager.setBrightness(Brightness.dark);
  });
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    final locale = ref.watch(languageProvider);
    return ScreenUtilInit(
        designSize: const Size(1920, 1080),
        minTextAdapt: true, //是否根据宽度/高度中的最小值适配文字
        splitScreenMode: true, //支持分屏尺寸
        builder: (context, child) {
          return MaterialApp.router(
            routerConfig: goRouter,
            title: 'fpBrowser',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
            unselectedWidgetColor: AppColors.color666666, // 未选中时的颜色（灰色）
          ),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: locale,
            supportedLocales: const [
              Locale('en', ''),
              Locale('zh', ''),
            ],
          );
        });
  }
}