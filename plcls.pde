class Player {
  String nome;
  color c;
  int x, y, vel, size;
  int[] dir = {0, 0};

  Player(int x, int y, int vel, int size, color c, String nome) {
    this.x = x;
    this.y = y;
    this.vel = vel;
    this.size = size;
    this.c = c;
    this.nome = nome;
  }

  //movimento
  void update(Wall[] ws) {
    int movx = 1, movy = 1;
    for (Wall w : ws) {
      if (movx == 1 && w.collides(x + dir[0]*vel, y, size)) {
        movx = 0;
      }
      if (movy == 1 && w.collides(x, y + dir[1]*vel, size)) {
        movy = 0;
      }
      if(movx == 0 && movy == 0) break;
    }
    if (movx == 1) x += dir[0]*vel;
    if (movy == 1) y += dir[1]*vel;
  }

  //desenha
  void draw(PGraphics cam) {
    cam.push();
    cam.fill(c);
    cam.rect(x, y, size, size);
    cam.text(nome, x-10, y-30);
    cam.pop();
  }
}
