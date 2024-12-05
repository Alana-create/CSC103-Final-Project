//Final Game
import processing.sound.*;
//declare sound var
SoundFile magicWand;
//2017-06-16_-_The_Dark_Castle_-_David_Fesliyan
SoundFile music;

int state = 0;
int score;
/////////////declare objects//////////////////
Player p1;

Page scroll;
/////walls/////
Obstacle o1;
Obstacle o2;
Obstacle o3;
Obstacle o4;
Obstacle o5;
Obstacle o6;

Obstacle lW;
Obstacle lWb;
Obstacle rW;
Obstacle rWb;
Obstacle tW;
Obstacle bW;
//////enemies//////
Enemy gob1;
Enemy gob2;
Enemy gob3;
Enemy gob4;
Enemy gob5;
Enemy gob6;
Enemy gob7;

Bbeg bbeg1;
///////chests//////
Chests c1;
Chests c2;
Chests c3;
Chests c4;
//////Array lists///////////////
ArrayList<Bullet> bulletList;
ArrayList<Enemy> enemyList1;
ArrayList<Enemy> enemyList2;
ArrayList<Enemy> enemyList3;

ArrayList<Bbeg> bbegList;

ArrayList<Obstacle> wallList;
ArrayList<Obstacle> wallList1;
ArrayList<Obstacle> wallList2;
ArrayList<Obstacle> wallList3;

ArrayList<Chests> chestList1;
ArrayList<Chests> chestList2;

void setup(){
  size(800,600);
  background(42);
  rectMode (CENTER);
  imageMode (CENTER);
  
  magicWand = new SoundFile(this, "magicwand.wav");
  music = new SoundFile(this, "DarkCastle.mp3");
  
  p1 = new Player(100,300,90,50);//,color(0,0,255));
  
  scroll = new Page(30,50,50,50);
  score = 0;
  ////chests////
  //state 1
  c1 = new Chests(700,100,50,100);
  c2 = new Chests(700,500,50,100);
  //state 2
  c3 = new Chests(700,100,50,100);
  c4 = new Chests(700,520,50,100);
  ////inside walls////
  //state 1
  o1 = new Obstacle(width/4, 400, 60, 500, color (255,0,0));
  o2 = new Obstacle(500, 200, 60, 400, color (255,0,0));
  //state 2
  o3 = new Obstacle(500, 200, 700, 60, color (255,0,0));
  //o4 = new Obstacle(490, 365, 100, 60, color (255,0,0));
  o5 = new Obstacle(180, 315, 60, 295, color (255,0,0));
  o6 = new Obstacle(590, 430, 440, 60, color (255,0,0));
  
  ////ouside walls////
  lW = new Obstacle(20, 115, 60, 222, color (255,0,0));
  lWb = new Obstacle(20, 475, 60, 210, color (255,0,0));
  rW = new Obstacle(width-20, 115, 40, 222, color (255,0,0));
  rWb = new Obstacle(width-20, 475, 40, 210, color (255,0,0));
  tW = new Obstacle(width/2, 0, width, 40, color (255,0,0));
  bW = new Obstacle(width/2, height, width, 40, color (255,0,0));
  ///////enemies/////////
  //state 1
  gob1 = new Enemy(430,100,60,color(0,255,0));
  gob2 = new Enemy(730,300,60,color(0,255,0));
  //state 2
  gob3 = new Enemy(450,100,60,color(0,255,0));
  gob4 = new Enemy(730,300,60,color(0,255,0));
  //state 3
  gob5 = new Enemy(430,100,60,color(0,255,0));
  gob6 = new Enemy(430,300,60,color(0,255,0));
  gob7 = new Enemy(430,500,60,color(0,255,0));
  
  bbeg1 = new Bbeg(730,300,100,color(255,0,255));
  
  /////////Lists//////////
  bulletList = new ArrayList<Bullet>();
  
  enemyList1 = new ArrayList<Enemy>();
  enemyList2 = new ArrayList<Enemy>();
  enemyList3 = new ArrayList<Enemy>();
  
  bbegList = new ArrayList<Bbeg>();
  
  wallList = new ArrayList<Obstacle>();
  wallList1 = new ArrayList<Obstacle>();
  wallList2 = new ArrayList<Obstacle>();
  wallList3 = new ArrayList<Obstacle>();
  
  chestList1 = new ArrayList<Chests>();
  chestList2 = new ArrayList<Chests>();
  //////////add objects to lists////////////
  addsEnemies();
  addsWalls();
  
  //state 1 chests
  chestList1.add(c1);
  chestList1.add(c2);
  
  //state 2 chests
  chestList2.add(c3);
  chestList2.add(c4);
  
  
}

void draw(){
  background(42);
  
  if(music.isPlaying() == false){
    music.play();    
  }
   
  stateMachine();
  changeState();
  //playerDeath();
    
  p1.render();
  p1.move();
  p1.screenCollision();
  
  scroll.render(); 
  textSize(50);
    fill(#A840FF);
    text(score, 15, height/4);
 }

void addsEnemies(){
  gob1 = new Enemy(430,100,60,color(0,255,0));
  gob2 = new Enemy(730,300,60,color(0,255,0));
  //state 2
  gob3 = new Enemy(450,100,60,color(0,255,0));
  gob4 = new Enemy(730,300,60,color(0,255,0));
  //state 3
  gob5 = new Enemy(430,100,60,color(0,255,0));
  gob6 = new Enemy(430,300,60,color(0,255,0));
  gob7 = new Enemy(430,500,60,color(0,255,0));
  
  //state 1 gobs
  enemyList1.add(gob1);
  enemyList1.add(gob2);
  //state 2
  enemyList2.add(gob3);
  enemyList2.add(gob4);
  //state 3
  enemyList3.add(gob5);
  enemyList3.add(gob6);
  enemyList3.add(gob7);  
  
  bbegList.add(bbeg1);
}

void addsWalls(){
  //title screen walls
  wallList.add(lW);
  wallList.add(rW);
  wallList.add(tW);
  wallList.add(bW);
  wallList.add(lWb);
  wallList.add(rWb);
  
  //state 1 walls
  wallList1.add(o1);
  wallList1.add(o2);
  
  wallList1.add(lW);
  wallList1.add(rW);
  wallList1.add(tW);
  wallList1.add(bW);
  wallList1.add(lWb);
  wallList1.add(rWb);
  
  //state 2
  wallList2.add(o3);
  //wallList2.add(o4);
  wallList2.add(o5);
  wallList2.add(o6);
  
  wallList2.add(lW);
  wallList2.add(rW);
  wallList2.add(tW);
  wallList2.add(bW);
  wallList2.add(lWb);
  wallList2.add(rWb);
  
  //state 3
  wallList3.add(lW);
  wallList3.add(rW);
  wallList3.add(tW);
  wallList3.add(bW);
  wallList3.add(lWb);
  wallList3.add(rWb);
}

void changeState(){
  if (p1.right>=width){
      state+=1;
    }
  if (state>=4){
    state = 0;
    addsEnemies();
    score = 0;
    p1.hitPoint = 0;
    
    //reset chest image
    for(Chests aChest: chestList1){
      aChest.isOpen = false;
    }
    for(Chests aChest: chestList2){
      aChest.isOpen = false;
    }
  }  
}

//void playerDeath(){
//  if(p1.hitPoint == 0){
//    deathScreen();    
//  }
//}

void stateMachine(){
  //finite sate machine
  switch (state){
    case 0:
      titleScreen();
    break;
    
    case 1:
      state1();      
    break;
    
    case 2:
      state2();
    break;
    
    case 3:
      state3();
    break;
    
    case 4:
      state4();
    break;
    
    //case 5:
    //  deathScreen();
    //break;
  }
}

void titleScreen(){
  background(42);
  textSize(80);
  fill(#A840FF);
  text("Defeat the Goblins!", width/9, height/4);
  
  textSize(50);
  text("Use arrow keys to move",50, 450);
  text("Use space bar to shoot",50, 550);
  
  //obstacle for loop
  for(Obstacle aWall : wallList){
    aWall.render();
    aWall.playerCollide(p1);
  }
  
  //bullet for loop
  for (Bullet aBullet : bulletList){
    aBullet.render();
    aBullet.move();
    aBullet.checkRemove();
    
    for (Obstacle aWall : wallList1){
      aBullet.shootWall(aWall);
    } 
  }
  
  //for loop that removes bullets
  for(int i = bulletList.size()-1; i>=0; i-=1){
     Bullet aBullet = bulletList.get(i); 
    
    if (aBullet.shouldRemove == true){
     bulletList.remove(aBullet); 
    }
  }
}

void state1(){
  
  //obstacle for loop
  for(Obstacle aWall : wallList1){
    aWall.render();
    aWall.playerCollide(p1);
  }
  
    //chests for loop
  for(Chests aChest : chestList1){
    aChest.render();
    aChest.playerCollide(p1);
    aChest.pageScore();
  }
  
  //bullet for loop
  for (Bullet aBullet : bulletList){
    aBullet.render();
    aBullet.move();
    aBullet.checkRemove();
    
    for (Enemy anEnemy : enemyList1){
      aBullet.shootEnemy(anEnemy);
    }
    
    for (Obstacle aWall : wallList1){
      aBullet.shootWall(aWall);
    } 

     aBullet.shootPlayer(p1);
    
  }
    //for loop that removes enemies
  for(int i = enemyList1.size()-1; i>=0; i-=1){
     Enemy anEnemy = enemyList1.get(i); 
    
    if (anEnemy.isDead == true){
     enemyList1.remove(anEnemy); 
    }
  }
  
  //for loop that removes bullets
  for(int i = bulletList.size()-1; i>=0; i-=1){
     Bullet aBullet = bulletList.get(i); 
    
    if (aBullet.shouldRemove == true){
     bulletList.remove(aBullet); 
    }
  }
  
  for (Enemy anEnemy : enemyList1){
    anEnemy.render();
    anEnemy.updateHitbox();
    anEnemy.playerCollision(p1);
    anEnemy.shoot();
  }
  
  
}


void state2(){
  //obstacle for loop
  for(Obstacle aWall : wallList2){
    aWall.render();
    aWall.playerCollide(p1);
  }
  
  //chests for loop
  for(Chests aChest : chestList2){
    aChest.render();
    aChest.playerCollide(p1);
  }
  
    //bullet for loop
  for (Bullet aBullet : bulletList){
    aBullet.render();
    aBullet.move();
    aBullet.checkRemove();
    
    for (Enemy anEnemy : enemyList2){
      aBullet.shootEnemy(anEnemy);
    }
    
    for (Obstacle aWall : wallList2){
      aBullet.shootWall(aWall);
    }  
    
    aBullet.shootPlayer(p1);
  }
    //for loop that removes enemies
  for(int i = enemyList2.size()-1; i>=0; i-=1){
     Enemy anEnemy = enemyList2.get(i); 
    
    if (anEnemy.isDead == true){
     enemyList2.remove(anEnemy); 
    }
  }
  
  //for loop that removes bullets
  for(int i = bulletList.size()-1; i>=0; i-=1){
     Bullet aBullet = bulletList.get(i); 
    
    if (aBullet.shouldRemove == true){
     bulletList.remove(aBullet); 
    }
  }
  
  for (Enemy anEnemy : enemyList2){
    anEnemy.render();
    anEnemy.updateHitbox();
    anEnemy.playerCollision(p1);
    anEnemy.shoot();
  }
}

void state3(){
  //obstacle for loop
  for(Obstacle aWall : wallList3){
    aWall.render();
    aWall.playerCollide(p1);
  }
  
  //bullet for loop
  for (Bullet aBullet : bulletList){
    aBullet.render();
    aBullet.move();
    aBullet.checkRemove();
    
    for (Enemy anEnemy : enemyList3){
      aBullet.shootEnemy(anEnemy);
    }
    
    for (Bbeg aBbeg : bbegList){
      aBullet.shootBbeg(aBbeg);
    }
    
    for (Obstacle aWall : wallList3){
      aBullet.shootWall(aWall);
    }  
    
    aBullet.shootPlayer(p1);
  }
    //for loop that removes enemies
  for(int i = enemyList3.size()-1; i>=0; i-=1){
     Enemy anEnemy = enemyList3.get(i); 
    
    if (anEnemy.isDead == true){
     enemyList3.remove(anEnemy); 
    }
  }
  
  for(int i = bbegList.size()-1; i>=0; i-=1){
     Bbeg aBbeg = bbegList.get(i); 
    
    if (aBbeg.isDead == true){
     bbegList.remove(aBbeg); 
    }
  }
  
  //for loop that removes bullets
  for(int i = bulletList.size()-1; i>=0; i-=1){
     Bullet aBullet = bulletList.get(i); 
    
    if (aBullet.shouldRemove == true){
     bulletList.remove(aBullet); 
    }
  }
  
  for (Enemy anEnemy : enemyList3){
    anEnemy.render();
    anEnemy.updateHitbox();
    anEnemy.playerCollision(p1);
    anEnemy.shoot();
  }
  if (enemyList3.size() == 0){
  for (Bbeg aBbeg : bbegList){
        
      aBbeg.render();
      aBbeg.updateHitbox();
      aBbeg.playerCollision(p1);
      aBbeg.shoot();
    }
  }
  
}


void state4(){
  background(23);
  textSize(80);
  fill(#A840FF);
  text("Victory!", width/3, height/4);  
  textSize(50);
  text("Continue onward to play again",50, 450);
  
  //obstacle for loop
  for(Obstacle aWall : wallList){
    aWall.render();
    aWall.playerCollide(p1);
  }
  
  //bullet for loop
  for (Bullet aBullet : bulletList){
    aBullet.render();
    aBullet.move();
    aBullet.checkRemove();
    
    for (Obstacle aWall : wallList1){
      aBullet.shootWall(aWall);
    } 
  }
  
  //for loop that removes bullets
  for(int i = bulletList.size()-1; i>=0; i-=1){
     Bullet aBullet = bulletList.get(i); 
    
    if (aBullet.shouldRemove == true){
     bulletList.remove(aBullet); 
    }
  }
}

void deathScreen(){
  background(23);
  textSize(80);
  fill(#A840FF);
  text("Defeat", width/3, height/4);  
  textSize(50);
  text("Continue onward to play again",50, 450);
  
  if (p1.right>=width){
      state=0;
    }
  
  //obstacle for loop
  for(Obstacle aWall : wallList){
    aWall.render();
    aWall.playerCollide(p1);
  }
  
  //bullet for loop
  for (Bullet aBullet : bulletList){
    aBullet.render();
    aBullet.move();
    aBullet.checkRemove();
    
    for (Obstacle aWall : wallList1){
      aBullet.shootWall(aWall);
    } 
  }
  
  //for loop that removes bullets
  for(int i = bulletList.size()-1; i>=0; i-=1){
     Bullet aBullet = bulletList.get(i); 
    
    if (aBullet.shouldRemove == true){
     bulletList.remove(aBullet); 
    }
  }
}

//////////////////////////////key pressed//////////////////
void keyPressed(){
  if (key == CODED){
    if (keyCode == UP){
      p1.isMovingUp = true;
      //playerAnimation.isAnimating = true;
    }
    if (keyCode == DOWN){
      p1.isMovingDown =true;
      //playerAnimation.isAnimating = true;
    }
    if (keyCode == LEFT){
      p1.isMovingLeft = true;
      //playerAnimation.isAnimating = true;
    }
    if (keyCode == RIGHT){
      p1.isMovingRight = true;
      //playerAnimation.isAnimating = true;
    }
  }
  
  if (key == ' '){
    p1.isAttacking = true;
    bulletList.add(new Bullet((p1.x+p1.w+1),p1.y, 15, color(255,255,255)));
    magicWand.play();
    magicWand.amp(0.1);
  }
}
    
void keyReleased(){
  if (key == CODED){
    if (keyCode == UP){
      p1.isMovingUp = false;
    }
    if (keyCode == DOWN){
      p1.isMovingDown =false;
    }
    if (keyCode == LEFT){
      p1.isMovingLeft = false;
    }
    if (keyCode == RIGHT){
      p1.isMovingRight = false;
    }
  }
  
  if (key == ' '){
    p1.isAttacking = false;    
  }
}
