class Bbeg{
    //vars
  
  PImage bbeg;
  PImage bbegShoot;
  
  int x;
  int y;
  int d;
  color c;
  
  //millis vars
  int startTime;
  int currentTime;
  int interval = 800;
  boolean isFiring = false;
  
  boolean isDead;
  
  //hitbox vars
  int left;
  int right;
  int top;
  int bottom;
  
  //constructor
  Bbeg(int startX, int startY, int startD, 
        color startC){
    x = startX;
    y = startY;
    d = startD;
    c = startC;
    
    left = x-d/2;
    right = x+d/2;
    top = y-d/2;
    bottom = y+d/2;
    
    startTime = millis();
    
    isDead = false;
    
    bbeg = loadImage("bbeg0.png");
    bbeg.resize(200,200);
    
    bbegShoot = loadImage("bbeg1.png");
    bbegShoot.resize(200,200);
  }
  
  //functions
  void render(){
    //fill(c);
    //circle(x,y,d);    
    if(isFiring == true){
      image(bbegShoot,x,y);
    }
    else{
    image(bbeg, x,y);
    }
  }

  void updateHitbox(){
    left = x-d/2;
    right = x+d/2;
    top = y-d/2;
    bottom = y+d/2;
  }
  
  void shoot(){
    currentTime = millis();
    //millis timer for enemy bullets (make it shoot only one bullet?)
   if(currentTime - startTime > interval){
    //println("Congrats Caty!");
    
    isFiring = !isFiring;
    startTime = millis();
  }
  
  if (isFiring == true){
    bulletList.add(new Bullet(x-d-1,y, -5, color(255,255,255)));
    isFiring = false;
  }
  }
  
  void playerCollision(Player aPlayer){
    //from left
    if(aPlayer.top<=bottom && aPlayer.bottom>=top 
       && aPlayer.right>=left && aPlayer.left<=left){
         aPlayer.isMovingRight=false;
         p1.x = left-d;
       }
    //from right
    if(aPlayer.top<=bottom && aPlayer.bottom>=top 
       && aPlayer.right>=right && aPlayer.left<=right){
         aPlayer.isMovingLeft=false;
         p1.x = right+d;
       }
    //from top
    if(aPlayer.top<=top && aPlayer.bottom>top 
       && aPlayer.right>=left && aPlayer.left<=right){
         aPlayer.isMovingDown=false;
         p1.y = top-d;
       }
    //from top
    if(aPlayer.top<bottom && aPlayer.bottom>=bottom 
       && aPlayer.right>=left && aPlayer.left<=right){
         aPlayer.isMovingDown=false;
         p1.y = bottom+d;
       }
  }
}