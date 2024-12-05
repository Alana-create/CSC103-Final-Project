class Page{
  //vars
  PImage paper;
  
  int x;
  int y;
  int w;
  int h;
  
  //constructor
  Page(int startX, int startY, int startW, int startH){
    x = startX;
    y = startY;
    w = startW;
    h = startH;
    
    paper = loadImage("paper.png");
    paper.resize(w,h);
  }
  
  //functions
  void render() {
    //fill(c);
    //rect(x, y, w, h);
    image(paper, x,y);
  }
}
