PImage imgLogo;
PImage imgHead;
PImage lego1;
PImage lego2;
PImage lego3;
Ball[][] balls;
Obstacle[][] obstacles;
Snake snake;
int rowOfBallDisplay = 7 ;//宣告共有七列的球
int numOfBalls = 2 ;//每列最多幾個球
int count = 0;//算現在出現到第幾列的球
int current =0;
int currentOb =0;
boolean start = false; 
boolean restart = false;
void setup(){
  background(191, 29, 41);
  size(400,600);
  smooth();
  imgHead = loadImage("imgHead.png");
  imgLogo = loadImage("imgLogo.png");
  lego1 = loadImage("lego1.png");
  lego2 = loadImage("lego2.png");
  lego3 = loadImage("lego3.png");
  balls = new Ball[rowOfBallDisplay][numOfBalls];
  obstacles = new Obstacle[rowOfBallDisplay][numOfBalls];
  for(int j = 0; j<rowOfBallDisplay;j++){
    for(int i = 0; i<numOfBalls;i++){
      balls[j][i] = new Ball(); // Create each object
      obstacles[j][i] = new Obstacle();
      
      balls[j][i].start(j);
      obstacles[j][i].start(i);
      balls[j][i].y = j*(-200);//每個球的y
      obstacles[j][i].y = j*(-100);//每個障礙物的y
    }
   }
  snake = new Snake();//create a Snake
  snake.start();
}
void draw(){
  background(191, 29, 41);

  if(mousePressed==true&&mouseX>=100&&mouseX<=300&&mouseY>=350&&mouseY<=430){
    start = true;
    snake.lengthOfSnake=1;
  }
  if(start){
    fill(255);
    //snake.lengthOfSnake=1;
    print("length:"+snake.lengthOfSnake);
    for(int a = 1; a<=snake.lengthOfSnake;a++){
      if(a==1){
         image(imgHead,snake.x-25 , snake.y-25, 25 ,25); 
      }
      else if( a==snake.lengthOfSnake){
        if((a%2)==1&&(a!=1)){
        fill(255);
      }
      if(a%2==0){
        fill(110);
      }
        ellipse(snake.x-12.5, snake.y-12.5+25*(a-1), 20, 20);
      }
      else{
        if((a%2)==1&&(a!=1)){
        fill(255);
      }
      if(a%2==0){
        fill(190);
      }
        ellipse(snake.x-12.5, snake.y-12.5+25*(a-1), 25, 25);
      }
      
    }

    if(keyPressed ==true){
      if(key=='a'){
        if((snake.x-25)<=0){
          snake.x = 25;
        }else{
            snake.x-=5;
          
        }
        
      }
      if(key=='d'){
        if((snake.x+5)>=400){
          snake.x = 400;
        }else{
          snake.x+=5;
        }
        
      }
    
    }
    for(int j = 0; j<rowOfBallDisplay;j++){
      for(int i = 0; i<numOfBalls;i++){
           balls[j][i].changePosition();
           balls[j][i].display();
           obstacles[j][i].changePosition();
           obstacles[j][i].display();
           print("ball x:"+balls[j][i].x+"  , y:"+balls[j][i].y+"\n");
           print("snake x:"+(snake.x-12.5)+"  , y:"+(snake.y-12.5)+"\n");
           if(balls[j][i].on==true){
             if((snake.x-12.5 >= balls[j][i].x-12.5)&&(snake.x-12.5 <= balls[j][i].x+12.5)&&(snake.y-12.5 <= balls[j][i].y+12.5)&&(snake.y-12.5 >= balls[j][i].y-12.5)){//如果蛇吃到球就會變長
               snake.lengthOfSnake += balls[j][i].row; 
               balls[j][i].on = false;
               print("length:"+snake.lengthOfSnake+"\n");
             }
           }
           if(obstacles[j][i].on==true){
             if((snake.x-12.5 >= obstacles[j][i].x-37.5)&&(snake.x-12.5 <= obstacles[j][i].x+37.5)&&(snake.y-12.5 <= obstacles[j][i].y+40)&&(snake.y-12.5 >= obstacles[j][i].y)){//如果蛇吃到球就會變長
               snake.lengthOfSnake--; 
               obstacles[j][i].number--;
               if(obstacles[j][i].number<=0){
                 obstacles[j][i].on = false;
               }
               
               if(snake.lengthOfSnake<=0){
                 start = false;
               }
               //print("length:"+snake.lengthOfSnake+"\n");
             }
           }
           
      }
      if(balls[j][numOfBalls-1].y>=600){
        current=j;//記錄哪一層的球消失
        updateBall(current);//renew the ball
      }
      
      if(obstacles[j][numOfBalls-1].y>=600){
        currentOb = j;
        updateOb(currentOb);
      }
    }
    
    textSize(20);
    fill(255);
    text("Snake length:"+snake.lengthOfSnake,40,60);
    
  }else{
    image(imgLogo,120,80);
    fill(255);
    noStroke();
    rect(100,350,200,80);
    fill(0);
    textSize(35);
    text("Start!",160,400);
  }
  
  
}


void updateBall(int row){
  for(int i = 0; i<numOfBalls;i++){
      //balls[row][i] = new Ball(); // Create each object 
      balls[row][i].start(row);
      balls[row][i].y = -200;
    }
}
void updateOb(int row){
  for(int i = 0; i<numOfBalls;i++){
      //balls[row][i] = new Ball(); // Create each object 
      obstacles[row][i].start(row);
      obstacles[row][i].y = -150;
    }
}
class Snake{
  float x,y;
  int lengthOfSnake;//蛇的長度
  
  void start(){
    x = 200;
    y = 350 ;
    lengthOfSnake = 1;
  }
  
  void addLength(int number){
    lengthOfSnake = lengthOfSnake + number;
    
  }
  
  void reduceLength(int number){
    lengthOfSnake = lengthOfSnake - number;
  }

}
class Ball{
  float x,y;
  int number;
  int row ;//記錄球有幾顆
  boolean on  = false;
  
  void start(int rowNumber){
    x =(round(random(1,16)))*25-12.5;
    y  = 0;
    row = int(random(1,4));
    on = true;
    
  }
  void display(){
    if(on == true){
      fill(255);
      ellipse(x, y, 25, 25);
      textSize(12);
      fill(0);
      text(row,x-4,y+4);
    }
  }
  
  void changePosition(){
    y = y+0.5;
    if(y>=600){
      on  = false;   
    }
  }
  void turn(){
    on  = true;
  }

}

class Obstacle{
  float x,y;
  int number;//障礙物的數值
  boolean on  = false;
  int photoNumber ;
  void start(int rowNumber){
    x =(round(random(1,16)))*25-12.5;
    y  = 0;
    number = int(random(1,rowNumber+3));
    on = true;
    photoNumber = int(random(1,3));
    
  }
  void display(){
    if(on == true){
      if(photoNumber==1){
        image(lego1,x-37.5, y, 75, 40);
      }else if(photoNumber==2){
        image(lego2,x-37.5, y, 75, 40);
      }else if(photoNumber==3){
        image(lego3,x-37.5, y, 75, 40);
      }
      //fill(76, 163, 162);
      //rect(x-12.5, y, 75, 25);
      textSize(12);
      fill(255);
      text(number,x-4,y+25);
    }
  }
  
  void changePosition(){
    y = y+0.5;
    if(y>=600){
      on  = false;   
    }
  }
  void turn(){
    on  = true;
  }
}