/*
 * @Author: your name
 * @Date: 2020-08-14 09:21:08
 * @LastEditTime: 2020-08-18 17:12:39
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \scangun\lib\pages\set.dart
 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/themeModel.dart';
import '../provider/locak_storage.dart';
import '../provider/currentLocale.dart';
import '../intl/localizations.dart';
class Set extends StatefulWidget {
  @override
  _SetState createState() => _SetState();
}
GlobalKey<_FreeLocalizations> freeLocalizationStateKey = new GlobalKey<_FreeLocalizations>(); 
class _SetState extends State<Set> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(DemoLocalizations.of(context).setTitle),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          InkWell(
              child:Card(
                child: ListTile(
                  title: Text(DemoLocalizations.of(context).themeSet),
                  trailing: Icon(Icons.arrow_right),
                ),
              ),
              onTap: () async
              {
                  int i = await showDialog<int>(
                        context: context,
                        builder: (BuildContext context) {
                          return SimpleDialog(
                            title: const Text('请选择主题'),
                            children: <Widget>[
                              SimpleDialogOption(
                                onPressed: () {
                                  // 返回1
                                  Navigator.pop(context, 1);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 6),
                                  child: const Text('蓝色'),
                                ),
                              ),
                              SimpleDialogOption(
                                onPressed: () {
                                  // 返回2
                                  Navigator.pop(context, 2);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 6),
                                  child: const Text('紫色'),
                                ),
                              ),
                              SimpleDialogOption(
                                onPressed: () {
                                  // 返回2
                                  Navigator.pop(context, 3);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 6),
                                  child: const Text('粉色'),
                                ),
                              ),
                               SimpleDialogOption(
                                onPressed: () {
                                  // 返回2
                                  Navigator.pop(context, 4);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 6),
                                  child: const Text('深粉'),
                                ),
                              ),
                            ],
                          );
                        });

                    if (i != null) {
                        if(i==1)
                        {               
                          Provider.of<ThemeModel>(context,listen: false).setTheme('blue');
                        }
                        else if(i==2)
                        {                
                          Provider.of<ThemeModel>(context,listen: false).setTheme('purple');
                        }
                        else if(i==3)
                        {                      
                          Provider.of<ThemeModel>(context,listen: false).setTheme('pink');
                        }
                        else if(i==4)
                        {                
                          Provider.of<ThemeModel>(context,listen: false).setTheme('deeppink');
                        }
                    }
              },
          ),
          InkWell(
                child:Card(
                child: ListTile(
                  title: Text(DemoLocalizations.of(context).langSet),
                  trailing: Icon(Icons.arrow_right),
                ),
              ),
              onTap: () async
              {
                  int i = await showDialog<int>(
                        context: context,
                        builder: (BuildContext context) {
                          return SimpleDialog(
                            title: const Text('请选择语言'),
                            children: <Widget>[
                              SimpleDialogOption(
                                onPressed: () {
                                  // 返回1
                                  Navigator.pop(context, 1);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 6),
                                  child: const Text('中文简体'),
                                ),
                              ),
                              SimpleDialogOption(
                                onPressed: () {
                                  // 返回2
                                  Navigator.pop(context, 2);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 6),
                                  child: const Text('美国英语'),
                                ),
                              ),
                            ],
                          );
                        });

                    if (i != null) {
                      if(i==1)
                      {
                               Provider.of<CurrentLocale>(context,listen: false).setLocale(const Locale('zh',"CH"));
                      }
                      else 
                      {
                               Provider.of<CurrentLocale>(context,listen: false).setLocale(const Locale('en',"US"));
                      }

                    }
              },
          )

          
        ],
      ),
    );
  }
}


class FreeLocalizations extends StatefulWidget{

  final Widget child;

  FreeLocalizations({Key key,this.child}):super(key:key);

  @override
  State<FreeLocalizations> createState() {
    return new _FreeLocalizations();
  }
}

class _FreeLocalizations extends State<FreeLocalizations>{

  Locale _locale = const Locale('zh','CH');

  changeLocale(Locale locale){
    setState((){
      _locale = locale;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return new Localizations.override(
      context: context,
      locale: _locale,
      child: widget.child,
    );
  }
}