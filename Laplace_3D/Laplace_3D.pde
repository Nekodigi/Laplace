int pSize = 10;
int w, h;
PVector[][] p;

void setup(){
  //size(500, 500, P3D);
  fullScreen(P3D);
  w = width/pSize;
  h = height/pSize;
  p = new PVector[w][h];
  
  for(int x = 0; x < w; x++){
    for(int y = 0; y < h; y++){
      if(y == 0 || y == h-1){
        p[x][y] = new PVector(x*pSize, 0, y*pSize);
      }else{
        p[x][y] = new PVector(x*pSize, map(noise((float)x/10, (float)y/10), 0, 1, -height/2, height/2), y*pSize);
      }
    }
  }
  
}

void draw(){
  background(255);
  noStroke();
  lights();
  translate(0, height/2, -height/2);
  rotateX((float)frameCount/100);
  translate(0, 0, -height/2);
  for(int x = 0; x < w-1; x++){
    beginShape(TRIANGLE_STRIP);
    for(int y = 0; y < h; y++){
      vertex(p[x][y].x, p[x][y].y, p[x][y].z);
      vertex(p[x+1][y].x, p[x+1][y].y, p[x+1][y].z);
    }
    endShape();
  }
  step();
  for(int y = 0; y < h; ++y){
    p[0][y] = new PVector(cos((float)y/h*TWO_PI)*width/8, sin((float)y/h*TWO_PI)*width/4, y*pSize);
    p[w - 1][y] = new PVector(cos((float)y/h*TWO_PI)*width/8+width, sin((float)y/h*TWO_PI)*width/4, y*pSize);
  }
}