/*
 * @Author: your name
 * @Date: 2020-07-29 15:10:48
 * @LastEditTime: 2020-08-18 17:06:25
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \flutter-Study\demo06\lib\main.dart
 */


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_intl/provider/locak_storage.dart';


import 'routes/routes.dart';
import 'provider/themeModel.dart';
import 'provider/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'intl/delegate.dart';
import 'intl/localizations.dart';
import 'provider/currentLocale.dart';
void main() {
  //2、创建顶层共享数据
  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ThemeModel()),
        ChangeNotifierProvider(create: (context)=>CurrentLocale())
      ],
      child: MyApp(),
    )
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //3、状态组件绑定,将主题状态与组件绑定
        return Consumer2<ThemeModel,CurrentLocale>(
          builder: (context,themeModel,currentLocale,child)
          {
            return MaterialApp(
               localizationsDelegates: [
                // 本地化的代理类
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                DemoLocalizationsDelegate.delegate
              ],
              locale: currentLocale.value,
               supportedLocales: [
                   const Locale('zh', 'CN'), // 中文简体
                   const Locale('en', 'US'), // 美国英语              
                //其它Locales
              ],
              theme: AppTheme.getThemeData(themeModel.value),
              onGenerateTitle: (context){                                              
                return DemoLocalizations.of(context).taskTitle;
              },
              initialRoute: welcomeRoute,
              routes: routes   
            );
          },
        );

  }
}

