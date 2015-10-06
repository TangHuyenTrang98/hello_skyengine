import 'package:sky/widgets.dart';
import 'package:sky/rendering.dart';
import 'dart:sky' as sky;
import 'spacewar.dart';

void main() {
  runApp(new DrawRectWidget());
}

class DrawRectWidget extends OneChildRenderObjectWidget {
  RenderObject createRenderObject() {
    Stage stage = new Stage(new DisplayObject(child: [new Sun(), new SpaceShip()]));
    stage.start();
    return stage;
  }
}
