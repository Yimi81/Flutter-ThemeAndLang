/*
 * @Author: your name
 * @Date: 2020-08-18 10:25:27
 * @LastEditTime: 2020-08-19 17:09:50
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \theme_intl\lib\intl\localizations.dart
 */
import 'package:flutter/material.dart';

class DemoLocalizations {

  final Locale locale;

  DemoLocalizations(this.locale);

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'task title': 'Yshow',
      'set title': 'Setting',
      'theme set': 'Theme Settings',
      'language set':'Language Settings',
      'content':'Click go to Settings'
    },
    'zh': {
      'task title': '易米八一',
      'set title': '设置',
      'theme set': '主题设置',
      'language set':'语言设置',

      'content':'点击前往设置'
    }
  };

  static Map<String, Map<String, List>> _localizedValues2 = {
    'en': {
      'tabs':["set","hot","sport","network"]
    },
    'zh':{
      'tabs':["设置","热门","体育","网络"]
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

  get tabsSet{
    return _localizedValues2[locale.languageCode]['tabs'];
  }

  get contentSet{
    return _localizedValues[locale.languageCode]['content'];
  }


    static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }
}