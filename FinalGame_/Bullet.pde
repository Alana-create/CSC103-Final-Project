class Bullet{
  //vars
  Animation blastAnimation;
  PImage[] sparkleImages = new PImage[2];
  
  int x;
  int y;
  int d;
  color c;
  int speed;
  boolean shouldRemove;
  //hitbox vars
  int left;
  int right;
  int top;
  int bottom;
  
  //constructor
  Bullet(int startX, int startY, int startSpeed, 
        color startC){
    x = startX;
    y = startY;
    d = 10;
    c = startC;
    speed = startSpeed;
    
    shouldRemove = false;
    
    left = x-d/2;
    right = x+d/2;
    top = y-d/2;
    bottom = y+d/2;
    
    //load all images for animation
  for (int index = 0; index<sparkleImages.length; index++){
    sparkleImages[index] = loadImage("sparkles"+index+".png");
  }
  //initialize animation
  blastAnimation = new Animation(sparkleImages, 0.1, 2);
  }

  
  //functions
  void render() {
    fill(c);
    //circle(x,y,d);
    blastAnimation.display(x,y);
    blastAnimation.isAnimating = true;  
    
  }
  
  void move(){
    x += speed;
    left = x-d/2;
    right = x+d/2;
    top = y-d/2;
    bottom = y+d/2;
  }
  
  void shootEnemy(Enemy anEnemy){
    if(top<=anEnemy.bottom && bottom>= anEnemy.top 
       && left<= anEnemy.right && right>=anEnemy.left){
      anEnemy.isDead = true;
      shouldRemove = true;
    }
  }
  
  void shootWall(Obstacle aWall){
    if(top<=aWall.bottom && bottom>=aWall.top 
       && left<= aWall.right && right>=aWall.left){
      shouldRemove = true;
    }
  }
  
  void shootPlayer(Player aPlayer){
    if(top<=aPlayer.bottom && bottom>=aPlayer.top 
       && left<= aPlayer.right && right>=aPlayer.left){
      shouldRemove = true;
      aPlayer.hitPoint = aPlayer.hitPoint-1;
    }
  }
    
  void shootBbeg(Bbeg aBbeg){
    if(top<=aBbeg.bottom && bottom>=aBbeg.top 
       && left<= aBbeg.right && right>=aBbeg.left){
      shouldRemove = true;
      aBbeg.isDead = true;
      }
    }
  
  void checkRemove(){
    if (x>width){
      shouldRemove = true;
    }
  }
}
