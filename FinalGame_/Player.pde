class Player{
  //vars
  Animation playerAnimation;
  PImage[] wizardImages = new PImage[2];
  PImage wizardAttack;
  
  int x;
  int y;
  int h;
  int w;
  color c;
  int xSpeed;
  int ySpeed;
  
  boolean isMovingUp;
  boolean isMovingDown;
  boolean isMovingLeft;
  boolean isMovingRight;
  boolean isAttacking;
  
  //hitbox vars
  int left;
  int right;
  int top;
  int bottom;
  
  int hitPoint;
  
  //constructor
  Player(int startX, int startY, int startH, int startW){//, 
        //color startC){
    x = startX;
    y = startY;
    h = startH;
    w = startW;
    //c = startC;
    
    xSpeed = 10;
    ySpeed = 10;
    
    isMovingUp = false;
    isMovingDown =false;
    isMovingLeft = false;
    isMovingRight = false;
    isAttacking = false;
    
    left = x-w/2;
    right = x+w/2;
    top = y-h/2;
    bottom = y+h/2;
    
    hitPoint = 5;
    
    wizardAttack = loadImage("wizard2.png");
    wizardAttack.resize(w*4,h*2);
    
    //load all images for animation
  for (int index = 0; index<wizardImages.length; index++){
    wizardImages[index] = loadImage("wizard"+index+".png");
  }
  //initialize animation
  playerAnimation = new Animation(wizardImages, 0.1, 2);
  }
  
  //functions
  void render() {
    //fill(c);
    //circle(x, y, d);
    if(isAttacking == true){
      image(wizardAttack,x,y);
    }
    else{
    playerAnimation.display(x,y);
    }
  }
  
  void move() {
    if (isMovingUp == true){
      y -= ySpeed;
      playerAnimation.isAnimating = true;
    }
    if (isMovingDown == true){
      y += ySpeed;
      playerAnimation.isAnimating = true;
    }
    if (isMovingLeft == true){
      x -= xSpeed;
      playerAnimation.isAnimating = true;
    }
    if (isMovingRight == true){
      x += xSpeed;
      playerAnimation.isAnimating = true;
    }
    else{
      playerAnimation.isAnimating = false;
    }
    //hitbox update
    left = x-w/2;
    right = x+w/2;
    top = y-h/2;
    bottom = y+h/2;
  }
  
  void screenCollision(){
    if (left<=0){
      x=w/2;
    }
    if (right>=width){
      x=w/2;
    }
  }
  
}
