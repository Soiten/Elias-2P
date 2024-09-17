
class Entity {
  int x, y, w, h;
  Entity(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void draw(PGraphics cam) {
    cam.rect(x, y, w, h);
  }
}

class Wall extends Entity {
  Wall(int a, int b, int c, int d) {
    super(a, b, c, d);
  }

  boolean collides(int px, int py, int psize) {
    if (px+psize>x && px<x+w && py+psize>y && py < y+h) {
      //println("colidiu", px, py, x, y, w, h);
      return true;
    }
    //println("false");
    return false;
  }

  void draw(PGraphics cam) {
    super.draw(cam);
  }
}
