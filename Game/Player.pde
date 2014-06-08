class Player{

//location as seen on screen, usually stationary
int x = 500;  
int y = 0;  
//location relative to the map
int locX = 25;
int locY = 100;
int animationint1= 0;
int animationint2= 0;
int yVel = 0;
int gravity = 1;
boolean isJumping = false;
boolean isLanding = false;
boolean secondJump = false;
int needToFall = 0;

int edgeLeft;
int edgeRight;

PImage img;


void display(ArrayList<Platform> platforms){
  offEdge(platforms);
  land(platforms);
  
  noStroke();
  fill(255,0,0);
 // rect(x, y, 25, 30);
 if (dir == 1){
   //animation1= Animation("nyanright",12);
   img = loadImage("nyanleft"+animationint2+".png");
   animationint2++;
   if(animationint2>11){
     animationint2=0;
   }
   //animation1.display(x,y);
 }
 else{
   img = loadImage("nyanright"+animationint1+".png");
   animationint1++;
   if(animationint1>11){
    animationint1=0;
  }
 }
 image(img,x, y);
  
}

void offEdge(ArrayList<Platform>  platforms){
  if (locX + 525 - 25 < edgeLeft || locX + 525 > edgeRight){
    isJumping = true;
  }
  
  
}

void land(ArrayList<Platform> platforms){
   // println(yVel);
    if (isJumping){
    
    yVel += gravity;
      
      
      //y += yVel;

      if (!isLanding && landed(platforms, yVel, 0)){
        y -= needToFall;
       yVel = 0;
       isLanding = true;
       isJumping = true;
       println("up stop");
      }
    
      
      else if (isLanding && landed(platforms, yVel, 1)){
        
        isJumping = false;
        isLanding = false;
        
        yVel = 0;
        y += needToFall;
        println("fall stop");
      }
      else{
       y += yVel; 
      }
    
    /*
           if (y + yVel>= 550){
            yVel = 0;
           y += (580-(y+30));
            isJumping = false;
            isLanding = false;
      }
    */
      
      if (yVel >= 0){
        isLanding = true;
      }
      

  }
  
}

boolean landed(ArrayList<Platform> platforms, int yVel, int dir){   //if dir==1, for falling; if dir==0, for checking if hit the bottom of a platform
  for (Platform platform : platforms){
    if (platform.intersects(locX, y + 30*dir + yVel)
       || platform.intersects(locX - 25, y + 30*dir + yVel) ){   //If either edge of player is on the platform
       

      needToFall = abs(platform.locY + 40 - 40*dir - (y + 30*dir));
      
      edgeLeft = platform.locX;
      edgeRight = platform.locX + platform.width;
      
      return true;
    }
    
  }
  return false;
   
}






void jump(){
  
  if (!isJumping ){
    isJumping = true;
    isLanding = false;
    secondJump = true;
    yVel -= 15;
    println("jump");
  }
  else if (isJumping && secondJump ){
      yVel -= 15;
      gravity = 1;
      secondJump = false;
      
      println("jump222");
    
  }
  
  
}
  


  
  
}
  
  
  

  

