/*
 * @Author: your name
 * @Date: 2020-08-18 13:40:26
 * @LastEditTime: 2020-08-18 14:06:15
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \theme_intl\lib\intl\delegate.dart
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'localizations.dart';
// //Locale代理类
// class DemoLocalizationsDelegate extends LocalizationsDelegate<DemoLocalizations> {
//   const DemoLocalizationsDelegate();

//   //是否支持某个Local
//   @override
//   bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

//   // Flutter会调用此类加载相应的Locale资源类
//   // Flutter会调用此类加载相应的Locale资源类
//   @override
//   Future<DemoLocalizations> load(Locale locale) {
//     print("$locale");
//     return SynchronousFuture<DemoLocalizations>(
//         DemoLocalizations(locale.languageCode == "zh")
//     );
//   }

//   @override
//   bool shouldReload(DemoLocalizationsDelegate old) => false;
  
 
// }


class DemoLocalizationsDelegate extends LocalizationsDelegate<DemoLocalizations>{

  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en','zh'].contains(locale.languageCode);
  }

  @override
  Future<DemoLocalizations> load(Locale locale) {
    return new SynchronousFuture<DemoLocalizations>(new DemoLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<DemoLocalizations> old) {
    return false;
  }

  static DemoLocalizationsDelegate delegate = const DemoLocalizationsDelegate();
}