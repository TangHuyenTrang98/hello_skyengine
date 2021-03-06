part of gragravity;

class Joystick extends DisplayObject {
  @override
  String objectName = "joystick";

  double size = 50.0;
  double minWidth = 25.0;
  bool isTouch = false;
  int touchId = 0;
  double minX = 0.0;
  double minY = 0.0;
  double get directionMax => size/2;
  double get directionX => x - minX;
  double get directionY => y - minY;

  @override
  void onInit(Stage stage) {
    this.size = stage.h / 6;
    this.minWidth = this.size / 2;
    this.x = stage.w / 2 + stage.x;
    this.y = (stage.h - this.size) + stage.y;
    this.minX = this.x;
    this.minY = this.y;
  }

  @override
  void onPaint(Stage stage, PaintingCanvas canvas) {
    Paint paint = new Paint();
    if (isTouch) {
      paint.color = const Color.fromARGB(0xaa, 0xaa, 0xaa, 0xff);
    } else {
      paint.color = const Color.fromARGB(0xaa, 0xff, 0xaa, 0xaa);
    }
    Rect r1 = new Rect.fromLTWH(x - size / 2, y - size / 2, size, size);
    Rect r2 = new Rect.fromLTWH(
        minX - minWidth / 2, minY - minWidth / 2, minWidth, minWidth);
    canvas.drawOval(r1, paint);
    canvas.drawOval(r2, paint);
  }

  @override
  void onTouch(Stage stage, int id, String type, double x, double y, double dx, double dy) {
    if (isTouch == false) {
      if (distance(x, y, this.x, this.y) < minWidth) {
        isTouch = true;
        this.minX = x;
        this.minY = y;
      }
    } else {
      if (id == touchId) {
        if (type == "pointerup") {
          isTouch = false;
          this.minX = this.x;
          this.minY = this.y;
        } else {
          this.minX = x;
          this.minY = y;
          double d = distance(this.x, this.y, this.minX, this.minY);
          if (d > size / 2) {
            double dd = abs(this.minX-this.x) + abs(this.minY-this.y);
            this.minX = this.x + size / 2 * (this.minX-this.x) / dd;
            this.minY = this.y + size / 2 * (this.minY-this.y) / dd;
          }
        }
      }
    }
  }

  double abs(double v) {
    return (v > 0 ? v : -1 * v);
  }

  double distance(double x1, double y1, double x2, double y2) {
    return math.sqrt(math.pow(x1 - x2, 2) + math.pow(y1 - y2, 2));
  }
}
