/* Inspired by Elisa from SMD, many thanks
 Watashi no idaina yūjin, erizeu ni kansha shimasu
 Vielen Dank an Eliseu, meine großartige Freundin
 Большое спасибо Елисеу, моему большому другу */

PGraphics cam1, cam2;
Player p1, p2;
PImage bg;
int playerSize = 20;
int wallCount = 10;
Wall[] walls = new Wall[wallCount];

void setup() {
  size(1000, 500);
  noStroke();
  colorMode(HSB, 360, 100, 100);

  bg = loadImage("ideai2.jpeg");

  //render das visões
  cam1 = createGraphics(500, 500);
  cam2 = createGraphics(500, 500);

  //var dos players
  playerSize = 20;
  int vel = 5;
  int hue = 0;
  p1 = new Player(200, 200, vel, playerSize, color(hue, 100, 100), "joao");
  p2 = new Player(600, 200, vel, playerSize, color((180 + hue)%360, 100, 100), "jonas");

  //cria as paredes aleatoriamente
  for (int i = 0; i<wallCount; i++) {
    walls[i] = new Wall(int(random(0, 1000)), int(random(0, 600)), int(random(1, 10))*10, int(random(1, 10))*10);
  }
}

void draw() {

  p1.update(walls);
  p2.update(walls);

  //render p1 env
  cam1.beginDraw();
  drawWorld(cam1, p1.x, p1.y);
  p2.draw(cam1);
  p1.draw(cam1);
  cam1.endDraw();
  image(cam1, 0, 0);

  //render p2 env
  cam2.beginDraw();
  drawWorld(cam2, p2.x, p2.y);
  p1.draw(cam2);
  p2.draw(cam2);
  cam2.endDraw();
  image(cam2, width/2, 0);


  rect(width/2-5, 0, 10, height);
}

void keyPressed() {
  if (key == 'a') p1.dir[0] = -1;
  if (key == 'd') p1.dir[0] = 1;
  if (key == 'w') p1.dir[1] = -1;
  if (key == 's') p1.dir[1] = 1;

  if (keyCode == LEFT ) p2.dir[0] = -1;
  if (keyCode == RIGHT) p2.dir[0] = 1;
  if (keyCode == UP   ) p2.dir[1] = -1;
  if (keyCode == DOWN ) p2.dir[1] = 1;
}

void keyReleased() {
  if (key == 'a') p1.dir[0] = 0;
  if (key == 'd') p1.dir[0] = 0;
  if (key == 'w') p1.dir[1] = 0;
  if (key == 's') p1.dir[1] = 0;

  if (keyCode == LEFT ) p2.dir[0] = 0;
  if (keyCode == RIGHT) p2.dir[0] = 0;
  if (keyCode == UP   ) p2.dir[1] = 0;
  if (keyCode == DOWN ) p2.dir[1] = 0;
}

void drawWorld(PGraphics cam, int x, int y) {
  cam.translate(200-(x+playerSize/2), 250-(y + playerSize/2));
  cam.background(0);
  cam.image(bg, 0, 0);
  for (int i = 0; i<wallCount; i++) {
    walls[i].draw(cam);
  }
}
