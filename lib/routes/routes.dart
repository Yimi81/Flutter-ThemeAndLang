/*
 * @Author: your name
 * @Date: 2020-07-17 15:41:46
 * @LastEditTime: 2020-08-17 16:09:56
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \scangun\lib\routes.dart
 */ 






import 'package:flutter/material.dart';

import '../pages/set.dart';
import '../pages/home.dart';
import '../pages/welcome.dart';

const String homeRoute = "/home";
const String welcomeRoute = "/welcome";
const String setRoute = "/set";


Map<String,WidgetBuilder> routes = <String, WidgetBuilder>{
  welcomeRoute:(context) => Welcome(),
  setRoute:(context) =>Set(),
  homeRoute:(context) => Home()
};
