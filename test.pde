int game = 1;
PFont f;   
ArrayList<ship> ships = new ArrayList<ship>(); //Array of ship objects
int level = 1;
int score;
int playerx;
int pwidth = 30;
int pheight = 10;
int frame = 60;
int playerspeed = 10;
int bugwidth = 80;

void setup()
{
  size(600,600);
  background(0);
  noCursor();
  f = createFont("PressStart2P.ttf", 16, true);
  playerx = width/2;
}

void draw() 
{
  background(0); //Transition Background
  switch(game)
  {
  case 1: 
    menu();
    break;

  case 2:
    game();
    break;
  case 3:
    gameover();
    break;
  }
}

void game()
{
  drawplayer();
  ship alien;
  
  int fontsize = 20;
  fill(255);
  textFont(f, fontsize);
  text("Score:", 150, 50);
  text("Level:", width - 225, 50);
  text(score, 225, 50);
  text(level, width - 150, 50);

  if (keyPressed)
  {
    if (keyCode == LEFT)
    {
      playerx = playerx - playerspeed;
    }
    if (keyCode == RIGHT)
    {
      playerx = playerx + playerspeed;
    }
    if (keyCode == UP)
    {

      float shipx;
      
      for (int i = 0; i < ships.size(); i++)
      {
        alien = ships.get(i);
        shipx = alien.shipx;
        
        if ((playerx+pwidth/2) >= shipx && (playerx + pwidth/2) <= shipx + bugwidth)
        {
          score++;
          ships.remove(i);
        }
      }
      stroke(255);
      line((playerx+pwidth/2), height - 50, (playerx+pwidth/2), 0);
    }
  }

  if (frameCount % frame == 0)
  {
    for (int i = 0; i < ships.size(); i++)
    {  
      alien = ships.get(i);
      alien.shipmove();
    }
  }


  for (int i = 0; i < ships.size(); i++)
  {  
    alien = ships.get(i);
    float shipy;
    shipy = alien.shipy;
    
    if(shipy > height - 50)
     {
        game=3;
     }
     
    alien.drawship();
  }

  if (ships.size() == 0)
  {
    level++;
    newlevel();
  }
}

void drawplayer() {
  fill(0, 255, 0);
  stroke(0);
  //rect(playerx, height - 50, pwidth, pheight);
  triangle(playerx, height -50, playerx + pwidth, height - 50, playerx + pwidth/2, height -70);
}

void newlevel()
{
  for (int i = 0; i < level; i++)
  {
    ships.add(new ship());
  }
}



void gameover()
{
  float linespace = height * 0.15;
  float space = width * 0.25;
  float fontsize2;
  fontsize2 = (((height + width) /2) * 0.1);
  textFont(f, fontsize2);                  // STEP 3 Specify font to be used
  fill(255);  
  textAlign(CENTER);// STEP 4 Specify font color 
  text("GAME OVER", width/2, height/2); 
  text("Score:", width/2, height/2 + linespace);// STEP 5 Display Text
  text(score, width/2 + space, height/2 + linespace);
  
  for(int i = ships.size() -1;i >= 0;i--)
  {
    ships.remove(i);  
  }

  if (keyPressed)
  {
    if (key == ENTER || key == RETURN || keyCode == 49 || key == ' ')
    {
      score = 0;
      level = 1;
      newlevel();
      game = 1;
      ships.remove(0);
      
    }
  }
}

void menu()
{
  float linespace = height * 0.15;
  float space = width * 0.15;
  float fontsize2;
  fontsize2 = (((height + width) /2) * 0.08);
  textFont(f, fontsize2);                  // STEP 3 Specify font to be used
  drawship();
  fill(255);
  textAlign(CENTER);// STEP 4 Specify font color 
  text("Alien Invaders", width/2, height/2);
  textFont(f, fontsize2 * 0.2);
  if(frame % 60 == 0)
  {
    text("Ready Player One", width/2, height/2 + linespace * 2);
  }



  if (keyPressed)
  {
    if (key == ENTER || key == RETURN || keyCode == 49 || key == ' ')
    {
      game = 2;
      newlevel();
    }
  }
}

void drawship()
  {
      float shipx = width/2;
      float shipy = 200;
      stroke(0);
      //rect(bugX, bugY,40,40);
      fill(255);
      arc(shipx, shipy - 3, 200, 100, PI, TWO_PI);
      fill(0,0,255);
      ellipse(shipx, shipy, 400, 50);
  }
  
class ship
{
  float shipx = random(0, width);
  float shipy = 60;
  int bugwidth = 80;
 
  
  void shipmove()
  {
    
      shipx += random(-200,200);
      shipy += 60;  
    
    
     if(shipx < 0)
        {
          shipx = random(0, 200);
        }
        
        if(shipx + bugwidth > width)
        {
          shipx = random(width - 200, width);
        }
  }
  
  void drawship()
  {
      stroke(0);
      //rect(bugX, bugY,40,40);
      fill(255);
      arc(shipx, shipy - 3, 40, 20, PI, TWO_PI);
      fill(0,0,255);
      ellipse(shipx, shipy, bugwidth, 10);
  }
   
}