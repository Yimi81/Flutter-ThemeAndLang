/*
 * @Author: your name
 * @Date: 2020-08-18 10:25:27
 * @LastEditTime: 2020-08-19 08:34:18
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \theme_intl\lib\intl\localizations.dart
 */
import 'package:flutter/material.dart';
//Locale资源类
// class DemoLocalizations {
//   DemoLocalizations(this.isZh);
//   //是否为中文
//   bool isZh = false;
//   //为了使用方便，我们定义一个静态方法
//   static DemoLocalizations of(BuildContext context) {
//     return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
//   }
//   //Locale相关值，title为应用标题
//   String get title {
//     return isZh ? "易国峰" : "Yshow";
//   }

 
//   //... 其它的值  
// }


class DemoLocalizations {

  final Locale locale;

  DemoLocalizations(this.locale);

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'task title': 'Yshow',
      'set title': 'Setting',
      'theme set': 'Theme Settings',
      'language set':'Language Settings'
    },
    'zh': {
      'task title': '易米八一',
      'set title': '设置',
      'theme set': '主题设置',
      'language set':'语言设置'
    }
  };

  get taskTitle{
    return _localizedValues[locale.languageCode]['task title'];
  }

  get setTitle{
    return _localizedValues[locale.languageCode]['set title'];
  }

  get themeSet{
    return _localizedValues[locale.languageCode]['theme set'];
  }
  
  get langSet{
    return _localizedValues[locale.languageCode]['language set'];
  }

    static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }
}