/*
 * @Author: your name
 * @Date: 2020-08-17 16:28:31
 * @LastEditTime: 2020-08-19 08:47:34
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \flutter-Study\demo06\lib\provider\themeModel.dart
 */


import 'package:flutter/material.dart';

/*1.创建theme数据Model
    这里的 Model 实际上就是我们的状态，它不仅储存了我们的数据模型，而且还包含了更改数据的方法，并暴露出它想要暴露出的数据
*/
class ThemeModel with ChangeNotifier {

      String _theme = 'blue';
      String get value => _theme;

      void setTheme(color) async
      {
          _theme = color;
          print(_theme);    
          notifyListeners();        
      }
}