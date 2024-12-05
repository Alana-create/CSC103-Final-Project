class Obstacle{
  //vars
  PImage walls;
  
  int x;
  int y;
  int w;
  int h;
  color c;
  
  //hitbox vars
  int left;
  int right;
  int top;
  int bottom;
  
  //constructor
  Obstacle(int startX, int startY, int startW, int startH, color startC){
    x = startX;
    y = startY;
    w = startW;
    h = startH;
    c = startC;
    
    left = x-w/2;
    right = x+w/2;
    top = y-h/2;
    bottom = y+h/2;
    
    walls = loadImage("walls2.png");
    walls.resize(w,h);
  }
  
  //functions
  void render() {
    fill(c);
    rect(x, y, w, h);
    image(walls, x,y);
  }
  
  void playerCollide(Player aPlayer){
    //from left
    if(aPlayer.top<=bottom && aPlayer.bottom>=top 
       && aPlayer.right>=left && aPlayer.left<=left){
         aPlayer.isMovingRight=false;
         p1.x = left-p1.w/2;
       }
    //from right
    if(aPlayer.top<=bottom && aPlayer.bottom>=top 
       && aPlayer.right>=right && aPlayer.left<=right){
         aPlayer.isMovingLeft=false;
         p1.x = right+p1.w/2;
       }
    //from top
    if(aPlayer.top<=top && aPlayer.bottom>top 
       && aPlayer.right>=left && aPlayer.left<=right){
         aPlayer.isMovingDown=false;
         p1.y = top-p1.h/2;
       }
    //from top
    if(aPlayer.top<bottom && aPlayer.bottom>=bottom 
       && aPlayer.right>=left && aPlayer.left<=right){
         aPlayer.isMovingDown=false;
         p1.y = bottom+p1.h/2;
       }
  }

}
