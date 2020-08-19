/*
 * @Author: your name
 * @Date: 2020-08-11 09:29:47
 * @LastEditTime: 2020-08-17 16:21:37
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \scangun\lib\pages\welcome.dart
 */
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  void initState()
  {
    super.initState();
    _controller = AnimationController(vsync:this,duration:Duration(milliseconds:3000));
    _animation = Tween(begin: 0.0,end:1.0).animate(_controller);

    _animation.addStatusListener((status) {
      if(status == AnimationStatus.completed)
      {
        Navigator.of(context).pushNamed('/home');
      }
    });
    _controller.forward();
  }
  @override
  void dispose()
  {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return FadeTransition( //透明度动画组件
      opacity: _animation,  //执行动画
      child: Container(
        color: Colors.white,
    
        child: Image.network(  //网络图片
         'http://pic1.win4000.com/pic/c/cf/cdc983699c.jpg' ,
        scale: 2.0,  //进行缩放
        fit:BoxFit.fill  // 充满父容器
      ),
      )
    );
  }
}