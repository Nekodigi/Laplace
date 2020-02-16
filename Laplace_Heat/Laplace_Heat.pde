int pSize = 10;
int w, h;
float[][] p;

void setup(){
  size(500, 500, P3D);
  w = width/pSize;
  h = height/pSize;
  p = new float[w][h];
  for(int y = 0; y < h; ++y){
    p[0][y] = sin((float)y/h*TWO_PI);
    p[w - 1][y] = sin((float)y/h*TWO_PI+PI);
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
  lights();
  noStroke();
  translate(width/2, height/2, -height);
  rotateX((float)frameCount/1000);
  rotateY((float)frameCount/100);
  rotateZ((float)frameCount/1000);
  translate(-width/2, 0, -height/2);
  for(int x = 0; x < w-1; x++){
    beginShape(TRIANGLE_STRIP);
    for(int y = 0; y < h; y++){
      vertex(x*pSize, p[x][y]*height, y*pSize);
      vertex(x*pSize+pSize, p[x+1][y]*height, y*pSize);
    }
    endShape();
  }
  step();
}