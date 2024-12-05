class Chests{
  //vars
  PImage chestClosed;
  PImage chestOpen;
  
  int x;
  int y;
  int w;
  int h;
  
  //hitbox vars
  int left;
  int right;
  int top;
  int bottom;
  
  boolean isOpen = false;
  boolean addPage = true;
  
  //constructor
  Chests(int startX, int startY, int startW, int startH){
    x = startX;
    y = startY;
    w = startW;
    h = startH;
    
    left = x-w/2;
    right = x+w/2;
    top = y-h/2;
    bottom = y+h/2;
    
    chestClosed = loadImage("chest0.png");
    chestClosed.resize(w*2,h);
    
    chestOpen = loadImage("chest1.png");
    chestOpen.resize(w*2,h);
  }
  
  //functions
  void render() {    
    //rect(x, y, w, h);
    if(isOpen == true){
      image(chestOpen, x,y);      
    }
    else{
      image(chestClosed, x,y);
    }   
    
  }
  
  void pageScore(){
    //if(addPage == true){
    //  score = score+1;
    //  addPage = false;
    //  println(score);
    //}
  }
  
  void playerCollide(Player aPlayer){
    //from left
    if(aPlayer.top<=bottom && aPlayer.bottom>=top 
       && aPlayer.right>=left && aPlayer.left<=right && addPage == true){
         aPlayer.isMovingRight=false;
         isOpen = true;
         score = score+1;
         addPage = false;
       }
    ////from right
    //if(aPlayer.top<=bottom && aPlayer.bottom>=top 
    //   && aPlayer.right>=right && aPlayer.left<=right){
    //     aPlayer.isMovingLeft=false;
    //     isOpen = true;
    //   }
    ////from top
    //if(aPlayer.top<=top && aPlayer.bottom>top 
    //   && aPlayer.right>=left && aPlayer.left<=right){
    //     aPlayer.isMovingDown=false;
    //     isOpen = true;
    //   }
    ////from top
    //if(aPlayer.top<bottom && aPlayer.bottom>=bottom 
    //   && aPlayer.right>=left && aPlayer.left<=right){
    //     aPlayer.isMovingDown=false;
    //     isOpen = true;
    //   }
  }
}
