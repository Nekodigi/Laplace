int pSize = 10;
int w, h;
PVector[][] p;

void setup(){
  size(500, 500);
  w = width/pSize;
  h = height/pSize;
  p = new PVector[w][h];
  
  for(int x = 0; x < w; x++){
    for(int y = 0; y < h; y++){
      p[x][y] = new PVector(x*pSize, y*pSize);
    }
  }
  
  for(int y = 0; y < h; ++y){
    p[0][y] = new PVector(sin((float)y/h*TWO_PI)*width/4, y*pSize);
    p[w - 1][y] = new PVector(sin((float)y/h*TWO_PI)*width/4+width, y*pSize);
  }
  
  //for(int n = 0; n < 1000; ++n){
    
  //  if(sum < EPSILON){
  //    println(n);
  //    break;
  //  }
  //}
}

void draw(){
  background(255);
  for(int x = 0; x < w-1; x++){
    beginShape(TRIANGLE_STRIP);
    for(int y = 0; y < h; y++){
      vertex(p[x][y].x, p[x][y].y);
      vertex(p[x+1][y].x, p[x+1][y].y);
    }
    endShape();
  }
  step();
}