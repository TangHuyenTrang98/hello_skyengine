# Widget Scaffold and Drawer

https://github.com/kyorohiro/hello_skyengine/tree/master/widget_scaffold_drawer

![](screen.png)

```
// following code is checked in 2016/01/13
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

void main() {
  // 2015/10/26 if use IconButton's icon option, need MatrialApp?
  runApp(new MaterialApp(
      title: "Drawer",
      routes: <String, RouteBuilder>{
        '/': (RouteArguments args) {
          return new DrawerTest();
        },
      }));
}

class DrawerTest extends StatefulComponent {
  State createState() {
    return new DrawerTestState();
  }
}

class DrawerTestState extends State<DrawerTest> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    Widget body = new Center(child: new Text("body"));
    Block block = new Block(<Widget>[
      createMyHeader("Start"),
      createMyItem("---s 0001"),
      createMyItem("---s 0002"),
      createMyHeader("Next"),
      createMyItem("---n 0001"),
      createMyItem("---n 0002")
    ]);
    Widget toolBar = new ToolBar(
      //  left: new IconButton(icon: "navigation/menu", onPressed: showMyDrawer),
        center: new Text("center"));
    Scaffold s = new Scaffold(
      key: scaffoldKey,toolBar: toolBar, body: body,
      drawer:  new Drawer(child:block),
      floatingActionButton: new FloatingActionButton(child: new Icon(
        icon: 'content/add',
        size: IconSize.s24
      ),onPressed: showMyDrawer)
    );

    return s;
  }

  void showMyDrawer() {
   scaffoldKey.currentState.openDrawer();
  //  showDatePicker();
    //showMenu();
    //showDrawer(context: this.context, child: block, level: 3);
  }

  DrawerHeader createMyHeader(String message) {
    return new DrawerHeader(child: new Text("${message}"));
  }

  DrawerItem createMyItem(String message) {
    return new DrawerItem(onPressed: () {
      print("pressed ${message}");
    }, child: new Text("${message}"));
  }
}
```


```
# flutter.yaml
material-design-icons:
  - name: action/account_balance
  - name: action/assessment
  - name: action/help
  - name: action/search
  - name: action/settings
  - name: action/thumb_down
  - name: action/thumb_up
  - name: content/add
  - name: navigation/arrow_back
  - name: navigation/menu
  - name: navigation/more_vert
```
