float step(){
  float sum = 1;//total difference
  for(int x = 1; x < w - 1; x++){
    for(int y = 1; y < w - 1; y++){
      //float oldx = p[x][y].x;
      //float nex = (p[x - 1][y].x + p[x + 1][y].x + p[x][y - 1].x + p[x][y + 1].x) / 4;
      //float diffx = (nex - oldx) * 1.7;//speed up transion
      //p[x][y].x += diffx;
      //sum += diffx;
      //float oldy = p[x][y].y;
      //float ney = (p[x - 1][y].y + p[x + 1][y].y + p[x][y - 1].y + p[x][y + 1].y) / 4;
      //float diffy = (ney - oldy) * 1.7;//speed up transion
      //p[x][y].y += diffy;
      //sum += diffy;
      PVector oldP = p[x][y].copy();
      PVector newP = PVector.add(p[x - 1][y], p[x + 1][y]).add(p[x][y - 1]).add(p[x][y + 1]).div(4);
      PVector diffP = PVector.sub(newP, oldP).mult(1.7);//0~2 Higher value move faster
      p[x][y].add(diffP);
      sum += diffP.mag();
    }
  }
  return sum;
}