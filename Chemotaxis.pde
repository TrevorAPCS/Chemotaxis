boolean menu = true;
int ti1 = 100;
int ti2 = 100;
int ti3 = 100;
int t1;
int t2;
int t3;
int t1w = 0;
int t2w = 0;
int t3w = 0;
int t1s = 4;
int t2s = 4;
int t3s = 4;
String winner;
boolean endGame = false;
int pos = 2;
Button t1p;
Button t1m;
Button t2p;
Button t2m;
Button t3p;
Button t3m;
Button t1ps;
Button t1ms;
Button t2ps;
Button t2ms;
Button t3ps;
Button t3ms;
Button t1p10;
Button t1m10;
Button t2p10;
Button t2m10;
Button t3p10;
Button t3m10;
Button rPos;
Button cPos;
Button tPos;
Button start;
Button mb;
Walker[] walkers;
void setup(){
  size(400, 450);
  t1p = new Button(85, 100, 45, 45, "+");
  t1m = new Button(30, 100, 45, 45, "-");
  t2p = new Button(205, 100, 45, 45, "+");
  t2m = new Button(150, 100, 45, 45, "-");
  t3p = new Button(325, 100, 45, 45, "+");
  t3m = new Button(270, 100, 45, 45, "-");
  t1ps = new Button(85, 240, 45, 45, "+");
  t1ms = new Button(30, 240, 45, 45, "-");
  t2ps = new Button(205, 240, 45, 45, "+");
  t2ms = new Button(150, 240, 45, 45, "-");
  t3ps = new Button(325, 240, 45, 45, "+");
  t3ms = new Button(270, 240, 45, 45, "-");
  t1p10 = new Button(85, 155, 45, 45, "+ 10");
  t1m10 = new Button(30, 155, 45, 45, "- 10");
  t2p10 = new Button(205, 155, 45, 45, "+ 10");
  t2m10 = new Button(150, 155, 45, 45, "- 10");
  t3p10 = new Button(325, 155, 45, 45, "+ 10");
  t3m10 = new Button(270, 155, 45, 45, "- 10");
  rPos = new Button(65, 345, 80, 30, "Random");
  cPos = new Button(160, 345, 80, 30, "Corner");
  tPos = new Button(255, 345, 80, 30, "Triangle");
  start = new Button(40, 385, 320, 50, "Start");
  mb = new Button(350, 405, 45, 40, "Menu");
}
void draw(){
  background(200);
  if(menu){
    noStroke();
    fill(255, 0, 0);
    rect(35, 30, 90, 280);
    rect(25, 40, 110, 260);
    ellipse(35, 40, 20, 20);
    ellipse(125, 40, 20, 20);
    ellipse(35, 300, 20, 20);
    ellipse(125, 300, 20, 20);
    fill(0, 255, 0);
    rect(155, 30, 90, 280);
    rect(145, 40, 110, 260);
    ellipse(155, 40, 20, 20);
    ellipse(245, 40, 20, 20);
    ellipse(155, 300, 20, 20);
    ellipse(245, 300, 20, 20);
    fill(0, 0, 255);
    rect(275, 30, 90, 280);
    rect(265, 40, 110, 260);
    ellipse(275, 40, 20, 20);
    ellipse(365, 40, 20, 20);
    ellipse(275, 300, 20, 20);
    ellipse(365, 300, 20, 20);
    stroke(1);
    t1p.show();
    t1m.show();
    t2p.show();
    t2m.show();
    t3p.show();
    t3m.show();
    t1ps.show();
    t1ms.show();
    t2ps.show();
    t2ms.show();
    t3ps.show();
    t3ms.show();
    t1p10.show();
    t1m10.show();
    t2p10.show();
    t2m10.show();
    t3p10.show();
    t3m10.show();
    rPos.show();
    cPos.show();
    tPos.show();
    start.show();
    fill(0);
    text("Red Wins: " + t1w, 80, 55);
    text("Green Wins: " + t2w, 200, 55);
    text("Blue Wins: " + t3w, 320, 55);
    text("Red: " + ti1, 80, 85);
    text("Green: " + ti2, 200, 85);
    text("Blue: " + ti3, 320, 85);
    text("Max Speed: " + t1s, 80, 225);
    text("Max Speed: " + t2s, 200, 225);
    text("Max Speed: " + t3s, 320, 225);
    if(pos == 1){
      text("Start Position: Random", 200, 335);
    }
    else if(pos == 0){
      text("Start Position: Corner", 200, 335);
    }
    else if(pos == 2){
      text("Start Position: Triangle", 200, 335);
    }
  }
  else{
    t1 = 0;
    t2 = 0;
    t3 = 0;
    for(int i = 0; i < walkers.length; i++){
      int ld = 400;
      Walker closest = walkers[0];
      for(int t = 0; t < walkers.length; t++){
        float distance = dist(walkers[i].x, walkers[i].y, walkers[t].x, walkers[t].y);
        if(distance < ld && walkers[i].type != walkers[t].type){
          ld = (int)distance;
          closest = walkers[t];
        }
        if(distance < 5 && walkers[i].food == walkers[t].type){
          walkers[t].type = walkers[i].type;
          walkers[t].maxSpeed = walkers[i].maxSpeed;
          walkers[t].food = walkers[i].food;
        }
      }
      walkers[i].target = closest;
      if(closest.type == walkers[i].food){
        walkers[i].chase = true;
      }
      else{
        walkers[i].chase = false;
      }
    }
    for(int i = 0; i < walkers.length; i++){
      walkers[i].move();
      walkers[i].show();
      if(walkers[i].type == 1){
        t1++;
      }
      else if(walkers[i].type == 2){
        t2++;
      }
      else{
        t3++;
      }
    }
    if(t1 == 0 && t2 == 0 && endGame == false){
      t3w++;
      winner = "Blue";
      endGame = true;
    }
    if(t3 == 0 && t2 == 0 && endGame == false){
      t1w++;
      winner = "Red";
      endGame = true;
    }
    if(t1 == 0 && t3 == 0 && endGame == false){
      t2w++;
      winner = "Green";
      endGame = true;
    }
    fill(100);
    rect(0, 400, 400, 50);
    textAlign(CENTER);
    textSize(15);
    noStroke();
    fill(255, 0, 0);
    rect(20, 405, 80, 40);
    rect(10, 415, 100, 20);
    ellipse(20, 415, 20, 20);
    ellipse(100, 415, 20, 20);
    ellipse(20, 435, 20, 20);
    ellipse(100, 435, 20, 20);
    fill(0);
    text("Red: " + t1, 60, 430);
    fill(0, 255, 0);
    rect(130, 405, 80, 40);
    rect(120, 415, 100, 20);
    ellipse(130, 415, 20, 20);
    ellipse(210, 415, 20, 20);
    ellipse(130, 435, 20, 20);
    ellipse(210, 435, 20, 20);
    fill(0);
    text("Green: " + t2, 170, 430);
    fill(0, 0, 255);
    rect(240, 405, 80, 40);
    rect(230, 415, 100, 20);
    ellipse(240, 415, 20, 20);
    ellipse(320, 415, 20, 20);
    ellipse(240, 435, 20, 20);
    ellipse(320, 435, 20, 20);
    fill(0);
    text("Blue: " + t3, 280, 430);
    stroke(1);
    mb.show();
    if(endGame){
      fill(100);
      rect(50, 50, 300, 300);
      fill(0);
      textSize(30);
      text("Winner: " + winner, 200, 200);
    }
  }
}
void mousePressed(){
  if(menu){
    t1p.checkClick();
    t1m.checkClick();
    t2p.checkClick();
    t2m.checkClick();
    t3p.checkClick();
    t3m.checkClick();
    t1ps.checkClick();
    t1ms.checkClick();
    t2ps.checkClick();
    t2ms.checkClick();
    t3ps.checkClick();
    t3ms.checkClick();
    t1p10.checkClick();
    t1m10.checkClick();
    t2p10.checkClick();
    t2m10.checkClick();
    t3p10.checkClick();
    t3m10.checkClick();
    rPos.checkClick();
    cPos.checkClick();
    tPos.checkClick();
    start.checkClick();
    if(t1p.pressed && ti1 < 200){
      ti1++;
    }
    if(t1m.pressed && ti1 > 1){
      ti1--;
    }
    if(t2p.pressed && ti2 < 200){
      ti2++;
    }
    if(t2m.pressed && ti2 > 1){
      ti2--;
    }
    if(t3p.pressed && ti3 < 200){
      ti3++;
    }
    if(t3m.pressed && ti3 > 1){
      ti3--;
    }
    if(t1ps.pressed && t1s < 6){
      t1s++;
    }
    if(t1ms.pressed && t1s > 3){
      t1s--;
    }
    if(t2ps.pressed && t2s < 6){
      t2s++;
    }
    if(t2ms.pressed && t2s > 3){
      t2s--;
    }
    if(t3ps.pressed && t3s < 6){
      t3s++;
    }
    if(t3ms.pressed && t3s > 3){
      t3s--;
    }
    if(rPos.pressed){
      pos = 1;
    }
    if(cPos.pressed){
      pos = 0;
    }
    if(tPos.pressed){
      pos = 2;
    }
    if(t1p10.pressed){
      if(ti1 < 190)
        ti1 += 10;
      else
        ti1 = 200;
    }
    if(t1m10.pressed){
      if(ti1 > 11)
        ti1 -= 10;
      else
        ti1 = 1;
    }
    if(t2p10.pressed){
      if(ti2 < 190)
        ti2 += 10;
      else
        ti2 = 200;
    }
    if(t2m10.pressed){
      if(ti2 > 11)
        ti2 -= 10;
      else
        ti2 = 1;
    }
    if(t3p10.pressed){
      if(ti3 < 190)
        ti3 += 10;
      else
        ti3 = 200;
    }
    if(t3m10.pressed){
      if(ti3 > 11)
        ti3 -= 10;
      else
        ti3 = 1;
    }
    if(start.pressed){
      t1 = ti1;
      t2 = ti2;
      t3 = ti3;
      endGame = false;
      walkers = new Walker[ti1 + ti2 + ti3];
      for(int i = 0; i < walkers.length; i++){
        if(pos == 1){
          if(i < ti1){
            walkers[i] = new Walker(10, 1, 2, t1s);
          }
          else if(i < ti1 + ti2){
            walkers[i] = new Walker(10, 2, 3, t2s);
          }
          else{
            walkers[i] = new Walker(10, 3, 1, t3s);
          }
        }
        else if(pos == 0){
          if(i < ti1){
            walkers[i] = new Walker(0, 0, 10, 1, 2, t1s);
          }
          else if(i < ti1 + ti2){
            walkers[i] = new Walker(0, 400, 10, 2, 3, t2s);
          }
          else{
            walkers[i] = new Walker(400, 0, 10, 3, 1, t3s);
          }
        }
        else{
          if(i < ti1){
            walkers[i] = new Walker(0, 0, 10, 1, 2, t1s);
          }
          else if(i < ti1 + ti2){
            walkers[i] = new Walker(200, 346, 10, 2, 3, t2s);
          }
          else{
            walkers[i] = new Walker(400, 0, 10, 3, 1, t3s);
          }
        }
      }
    menu = false;
    }
  }
  else{
    mb.checkClick();
    if(mb.pressed){
      menu = true;
    }
  }
}
class Walker{
  int x, y, size, type, food, maxSpeed;
  boolean chase;
  boolean alive = true;
  Walker target;
  boolean targetInitialized;
  Walker(int s, int t, int f, int mS){
    chase = false;
    x = (int)(Math.random() * 400);
    y = (int)(Math.random() * 400);
    size = s;
    type = t;
    food = f;
    maxSpeed = mS;
  }
  Walker(int pX, int pY, int s, int t, int f, int mS){
    chase = false;
    x = pX;
    y = pY;
    size = s;
    type = t;
    food = f;
    maxSpeed = mS;
  }
  void move(){
      if(chase){
        if(x < target.x){
          x += (int)(Math.random()*maxSpeed);
        }
        else{
          x += (int)(Math.random()*-maxSpeed);
        }
        if(y < target.y){
          y += (int)(Math.random()*maxSpeed);
        }
        else{
          y += (int)(Math.random()*-maxSpeed);
        }
      }
      else{
        if(x > target.x){
          x += (int)(Math.random()*maxSpeed);
        }
        else if(x < target.x){
          x += (int)(Math.random()*-maxSpeed);
        }
        else{
          x += (int)(Math.random() * (maxSpeed * 2 - 1)) - maxSpeed;
        }
        if(y > target.y){
          y += (int)(Math.random()*maxSpeed);
        }
        else if(y < target.y){
          y += (int)(Math.random()*-maxSpeed);
        }
        else{
          y += (int)(Math.random() * (maxSpeed * 2 - 1)) - maxSpeed;
        }
      }
    if(x > 400)
      x = 400;
    else if(x < 0)
      x = 0;
    if(y > 400)
      y = 400;
    else if(y < 0)
      y = 0;
  }
  void show(){
    if(type == 1){
      fill(255, 0, 0);
    }
    else if(type == 2){
      fill(0, 255, 0);
    }
    else{
      fill(0, 0, 255);
    }
    ellipse(x, y, size, size);
  }
}
class Button{
  int x, y, sX, sY;
  String bText;
  boolean pressed = false;
  Button(int pX, int pY, int sizeX, int sizeY, String buttonText){
    x = pX;
    y = pY;
    sX = sizeX;
    sY = sizeY;
    bText = buttonText;
  }
  void checkClick(){
    if(mouseX >= x && mouseX <= x + sX && mouseY >= y && mouseY <= y + sY){
      pressed = true;
    }
    else{
      pressed = false;
    }
  }
  void show(){
    if(mouseX >= x && mouseX <= x + sX && mouseY >= y && mouseY <= y + sY){
      fill(100);
    }
    else{
      fill(125);
    }
    rect(x, y, sX, sY);
    fill(0);
    textAlign(CENTER);
    textSize(15);
    text(bText, x + sX/2, y + sY/2);
  }
}
