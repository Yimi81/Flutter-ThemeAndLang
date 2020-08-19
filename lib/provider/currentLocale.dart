/*
 * @Author: your name
 * @Date: 2020-08-18 16:51:44
 * @LastEditTime: 2020-08-18 17:05:29
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \theme_intl\lib\intl\currentLocale.dart
 */
import 'package:flutter/material.dart';


class CurrentLocale with ChangeNotifier 
{
    Locale _locale = const Locale('zh','CN');
 
    Locale get value => _locale;
    void setLocale(locale) 
    {
        _locale = locale;   
        notifyListeners();         
    }
}