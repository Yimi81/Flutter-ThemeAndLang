/*
 * @Author: your name
 * @Date: 2020-08-17 16:06:03
 * @LastEditTime: 2020-08-18 14:18:31
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \theme_intl\lib\pages\home.dart
 */
import 'package:flutter/material.dart';
import 'dart:convert';
import 'MyDrawer.dart';
import 'package:dio/dio.dart';
import '../intl/delegate.dart';
import '../intl/localizations.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>  with SingleTickerProviderStateMixin{

  TabController _tabController;
  List tabs = ["设置","热门","体育","网络"];

  @override
  void initState()
  {
    super.initState();
    _tabController = new TabController(length: tabs.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      //AppBar相关属性
      appBar: AppBar(
          title: Text(DemoLocalizations.of(context).taskTitle),
          
          centerTitle: true,
          actions: [
            IconButton(icon: Icon(Icons.search),onPressed: (){},),
            IconButton(icon: Icon(Icons.add),onPressed: (){},)
          ],
          bottom: TabBar(
              controller: _tabController,
              tabs:tabs.map((e) => Tab(text: e,)).toList()
          ),
      ),
      //Scaffold常用属性

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()
        {
          showDialog(
            barrierDismissible: false,//点击空白区域不关闭对话框
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('提示'),
                content: Text('确认添加吗？'),
                actions: <Widget>[
                  FlatButton(child: Text('取消'),onPressed: (){Navigator.of(context).pop();},),
                  FlatButton(child: Text('确认'),onPressed: (){},),
                ],
              );
            });
        },
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      drawer: MyDrawer(),

      body:TabBarView(
        controller: _tabController,
        children:[
              Center(
              child: GestureDetector(
                child: Text("点击前往设置",textScaleFactor: 2),
                onTap: ()
                {
                  Navigator.of(context).pushNamed('/set');
                },
              ),
            ),
            Center(
              child: HotButton()
            ),
            Center(
                child: SportButton()
            ),
            Center(
                child: RaisedButton(
                  child: Text("从网络获取数据"),
                  onPressed: () async{
                    var dio = Dio();
                    try{
                        Response response = await dio.get('https://www.wanandroid.com/friend/json');                                            
                        print(response.data);
                        Map items = json.decode(response.data);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('提示'),
                                content: Text(items[0].name.toString()),
                                actions: <Widget>[
                                  FlatButton(child: Text('取消'),onPressed: (){},),
                                  FlatButton(child: Text('确认'),onPressed: (){},),
                                ],
                              );
                            });

                    }catch(e)
                    {
                      print(e);
                    }

                  }
                )
            )
        ] ,
      ),
 
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: Icon(Icons.home),onPressed: (){},),
            SizedBox(),
            IconButton(icon: Icon(Icons.business),onPressed: (){}),
          ],
        ),
      ),
    );
  }
}

//需要将RaiseButton剥离出来,因为build方法如果嵌套build后,接收不到外层的context参数;或者body套一层Builder组件
class HotButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Text("热门",textScaleFactor: 5),
                    RaisedButton(
                      child:Text("打开抽屉菜单"),
                      onPressed: (){
                        Scaffold.of(context).openDrawer();
                    })
                ],

    );
  }
}

class SportButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                child:Text("体育",textScaleFactor: 5),
                onTap: ()
                {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      action: SnackBarAction(label: '确定', onPressed: (){print("yes");}),
                      content: Text('I am so tired,my heart is break'),
                      duration: Duration(seconds:2),   
                      behavior: SnackBarBehavior.floating,                  
                    )
                  );
                },
    );
  }
}

