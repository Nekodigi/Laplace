float step(){
  float sum = 1;//total difference
  for(int x = 1; x < w - 1; x++){
    for(int y = 1; y < w - 1; y++){
      float old = p[x][y];
      float ne = (p[x - 1][y] + p[x + 1][y] + p[x][y - 1] + p[x][y + 1]) / 4;
      float diff = (ne - old) * 1.7;//speed up transion
      p[x][y] += diff;
      sum += diff;
    }
  }
  return sum;
}