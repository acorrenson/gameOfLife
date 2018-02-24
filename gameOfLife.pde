int w;
int h;
int g;
boolean[][] grid;

void setup() {
  size(1000, 500);
  w = 100;
  h = 50;
  g = 0;
  grid = new boolean[h][w];
  for (int i = 0; i < h; i++) {
    for (int j = 0; j < w; j++) {
      if (random(1) < .4) grid[i][j] = true;
    }
  }
  frameRate(30);
}

void draw() {
  background(55);
  fill(0, 255, 255);
  textSize(25);
  text(g, 20, 20);
  update();
  for (int i = 0; i < h; i++) {
    for (int j = 0; j < w; j++) {
      noStroke();
      fill(255);
      if (grid[i][j]) ellipse(j*10, i*10, 9, 9);
    }
  }
}

void update() {
  g++;
  boolean[][] buff = new boolean[h][w];
  for (int i = 0; i < h; i++) {
    for (int j = 0; j < w; j++) {
      int c = 0;
      c += getpos(i + 1, j);
      c += getpos(i - 1, j);
      c += getpos(i + 1, j + 1);
      c += getpos(i + 1, j - 1);
      c += getpos(i - 1, j + 1);
      c += getpos(i - 1, j - 1);
      c += getpos(i, j + 1);
      c += getpos(i, j - 1);

      buff[i][j] = grid[i][j]; 

      if (!buff[i][j] && c == 3) buff[i][j] = true;
      else if (buff[i][j] && (c < 2 || c > 3)) buff[i][j] = false;
    }
  }
  grid = buff;
}

int getpos(int i, int j) {
  if (i >= 0 && i < h && j > 0 && j < w && grid[i][j])
    return 1;
  return 0;
}