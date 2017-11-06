Ball[][] balls;
Snake snake;
int rowOfBallDisplay = 7 ;//宣告共有七列的球
int numOfBalls = 2 ;//每列最多幾個球
int count = 0;//算現在出現到第幾列的球
int current =0;
boolean start = false; 
void setup(){
  background(0);
  size(400,600);
  smooth();
  balls = new Ball[rowOfBallDisplay][numOfBalls];
  for(int j = 0; j<rowOfBallDisplay;j++){
    for(int i = 0; i<numOfBalls;i++){
      balls[j][i] = new Ball(); // Create each object 
      balls[j][i].start(j);
      balls[j][i].y = j*(-200);//每個球的y
    }
   }
  snake = new Snake();//create a Snake
  snake.start();
}
void draw(){
  background(0);
  //fill(76, 163, 162);
  //rect(100,350,200,80);
  //fill(255);
  //textSize(35);
  //text("Start!",160,400);
  
  if(mousePressed==true&&mouseX>=100&&mouseX<=300&&mouseY>=350&&mouseY<=430){
    start = true;
  }
  if(start){
    fill(188, 231, 110);
    print("length:"+snake.lengthOfSnake);
    for(int a = 1; a<=snake.lengthOfSnake;a++){
      
      ellipse(snake.x-12.5, snake.y-12.5+25*(a-1), 25, 25);
    }
    
    //for(int a = count; a<5;a++){
      //balls[0][a].start(a);
      //balls[count][a].start(a);
    //}
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
        
        //if(count==6){
          //System.out.println("in");
          // balls[j][i].changePosition(); 
          // balls[j][i].start(i); 
           //for(int a = 0; a<rowOfBallDisplay-1;a++){
           //   for(int b = 0; b<numOfBalls;b++){
           //     balls[a][b] = balls[a+1][b];
           //     balls[a][b].changePosition();
           //   }
           // }  
            //count=0;
            //balls[count][i].start(count);
        //}
           
           //balls[count][i].start(count);
            balls[j][i].changePosition();
           //if((count==j)&&(balls[count][i].y%100==0)){
           //  balls[count][i].start(count);
           //  if(i==2){
           //    count++;
           //    System.out.println(" count "+count+" j"+j);
           //  }
             
           //}
         
         balls[j][i].display();
         print("ball x:"+balls[j][i].x+"  , y:"+balls[j][i].y+"\n");
         print("snake x:"+(snake.x-12.5)+"  , y:"+(snake.y-12.5)+"\n");
         if((snake.x-12.5 == balls[j][i].x)&&(snake.y-12.5 == balls[j][i].y)){//如果蛇吃到球就會變長
           snake.lengthOfSnake += balls[j][i].row; 
           balls[j][i].on = false;
           print("length:"+snake.lengthOfSnake+"\n");
         }
      }
      if(balls[j][numOfBalls-1].y>=600){
        current=j;
        update(current);
      }
    }
    //count=0;fill(188, 231, 110);
    print("length:"+snake.lengthOfSnake);
    for(int a = 1; a<=snake.lengthOfSnake;a++){
      
      ellipse(snake.x-12.5, snake.y-12.5+25*(a-1), 25, 25);
    }
    
    //for(int a = count; a<5;a++){
      //balls[0][a].start(a);
      //balls[count][a].start(a);
    //}
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
        
        //if(count==6){
          //System.out.println("in");
          // balls[j][i].changePosition(); 
          // balls[j][i].start(i); 
           //for(int a = 0; a<rowOfBallDisplay-1;a++){
           //   for(int b = 0; b<numOfBalls;b++){
           //     balls[a][b] = balls[a+1][b];
           //     balls[a][b].changePosition();
           //   }
           // }  
            //count=0;
            //balls[count][i].start(count);
        //}
           
           //balls[count][i].start(count);
            balls[j][i].changePosition();
           //if((count==j)&&(balls[count][i].y%100==0)){
           //  balls[count][i].start(count);
           //  if(i==2){
           //    count++;
           //    System.out.println(" count "+count+" j"+j);
           //  }
             
           //}
         
         balls[j][i].display();
         print("ball x:"+balls[j][i].x+"  , y:"+balls[j][i].y+"\n");
         print("snake x:"+(snake.x-12.5)+"  , y:"+(snake.y-12.5)+"\n");
         if((snake.x-12.5 == balls[j][i].x)&&(snake.y-12.5 == balls[j][i].y)){//如果蛇吃到球就會變長
           snake.lengthOfSnake += balls[j][i].row; 
           balls[j][i].on = false;
           print("length:"+snake.lengthOfSnake+"\n");
         }
      }
      if(balls[j][numOfBalls-1].y>=600){
        current=j;
        update(current);
      }
    }
    //count=0;
  
  }else{
    fill(76, 163, 162);
    rect(100,350,200,80);
    fill(255);
    textSize(35);
    text("Start!",160,400);
  }
  
  
}
void update(int row){
  for(int i = 0; i<numOfBalls;i++){
      //balls[row][i] = new Ball(); // Create each object 
      balls[row][i].start(row);
      balls[row][i].y = -200;
    }
}
class Snake{
  float x,y;
  int lengthOfSnake;//蛇的長度
  
  void start(){
    x = 200;
    y = 400 ;
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
      fill(32, 73, 104);
      ellipse(x, y, 25, 25);
      textSize(12);
      fill(255);
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