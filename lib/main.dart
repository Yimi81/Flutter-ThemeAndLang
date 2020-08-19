/*
 * @Author: your name
 * @Date: 2020-07-29 15:10:48
 * @LastEditTime: 2020-08-19 13:22:15
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
  //2、注册顶层共享数据
  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ThemeModel()),//此是主题状态注册
        ChangeNotifierProvider(create: (context)=>CurrentLocale())
      ],
      child: MyApp(),
    )
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //3、状态组件绑定,将语言状态与组件绑定
        return Consumer<CurrentLocale>(   //语言设置1：语言状态获取方式，暂时只看CurrentLocale
          builder: (context,currentLocale,child)
          {
            return MaterialApp(
               localizationsDelegates: [
                // 本地化的代理类
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                DemoLocalizationsDelegate.delegate
              ],
              locale: currentLocale.value,//语言设置2
               supportedLocales: [
                   const Locale('zh', 'CN'), // 中文简体
                   const Locale('en', 'US'), // 美国英语              
                //其它Locales
              ],
         
              onGenerateTitle: (context){                                              
                return DemoLocalizations.of(context).taskTitle;
              },
              initialRoute: welcomeRoute,//欢迎页
              routes: routes   //注册路由
            );
          },
        );

  }
}

