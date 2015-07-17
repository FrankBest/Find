boolean [][] i=new boolean [50][50];
boolean [][] way=new boolean [50][50];
int [][] j=new int [50][50];
int x,y,k,l,sx,sy,dx,dy,max;
boolean check,checkend,checkdone;

void setup ()
{
  size (1200,600);
  for (int a=0;a<50;a++)
  {
    for (int b=0;b<50;b++)
    {
      k=int (random(0,6));
      if (k==0)
      {
        i[a][b]=true;
      }  
      else
      {
        i[a][b]=false;
      }  
    }  
  } 
  sx=0;
  sy=0;
  dx=49;
  dy=49;
  i[0][0]=false;
  i[49][49]=false;
  check=false;
}

void draw ()
{
  background (255);
  stroke (255,255,0);
  strokeWeight (0);
  for (int a=0;a<51;a++)
  {
    line (a*10,0,a*10,500);
    line (0,a*10,500,a*10);
  }  
  fill (255);
  rect (0,500,400,100);
  fill (0);
  textSize (100);
  text ("FIND",0,600);
  textSize (40);
  text ("TURN SQUARES INTO BLACK",500,40);
  text ("PRESS E AND DRAW",500,80);
  text ("TURN SQUARES INTO WHITE",500,120);
  text ("PRESS W AND DRAW",500,160);
  text ("SET THE START POINT",500,200);
  text ("PRESS S AND CLICK",500,240);
  text ("SET THE DESTINATION",500,280);
  text ("PRESS D AND CLICK",500,320);  
  text ("TURN ALL SQUARES INTO BLACK",500,360);
  text ("PRESS Q AND DRAW",500,400);
  text ("TURN ALL SQUARES INTO WHITE",500,440);
  text ("PRESS A AND CLICK",500,480);
  text ("RANDOM",500,520);
  text ("PRESS R AND CLICK",500,560);  
  text ("THANK YOU FOR READING THIS",500,600);
  for (int a=0;a<50;a++)
  {
    for (int b=0;b<50;b++)
    {
      if (i[a][b])
      {
        fill (0);
        rect (a*10,b*10,10,10);
      }  
      if (way[a][b])
      {
        fill (255,127,127);
        rect (a*10,b*10,10,10);
      }  
    }  
  }
  fill (127,127,255);
  rect (sx*10,sy*10,10,10);
  rect (dx*10,dy*10,10,10);
  if (check)
  {
    find ();
    for (int a=0;a<50;a++)
    {
      for (int b=0;b<50;b++)
      {
        if (j[a][b]>0)
        {
          fill (0);
          textSize (4);
          text (j[a][b],a*10,b*10+10);
        }
      }
    } 
    if (!checkend)
    {
      fill (191);
      for (int a=0;a<50;a++)
      {
        for (int b=0;b<50;b++)
        {
          if (j[a][b]==0 && !i[a][b])
          {
            if (a!=dx || b!=dy)
            {
              rect (a*10,b*10,10,10);
            }  
          }  
        } 
      }   
    }
    if (checkend)
    {
      stroke (255,0,0);
      strokeWeight (4);
      for (int a=0;a<50;a++)
      {
        for (int b=0;b<50;b++)
        {
          if (j[a][b]==0 && !i[a][b])
          {
            line (a*10,b*10,a*10+10,b*10+10);
            line (a*10,b*10+10,a*10+10,b*10);
          }  
        } 
      }   
    }  
    stroke (255,127,127);
    strokeWeight (0);
    if (checkend && j[dx][dy]>0)
    {
      fill (255,127,127);
      if (k!=sx || l!=sy)
      {
        checkdone=false;
        if (k>0 && !checkdone)
        {
          if (j[k-1][l]==j[k][l]-1)
          {
            k=k-1;
            checkdone=true;
          }
        }  
        if (k<49 && !checkdone)
        {  
          if (j[k+1][l]==j[k][l]-1)
          {
            k=k+1;
            checkdone=true;
          }
        }  
        if (l>0 && !checkdone)
        {
          if (j[k][l-1]==j[k][l]-1)
          {
            l=l-1;
            checkdone=true;
          }
        }  
        if (l<49 && !checkdone)
        {
          if (j[k][l+1]==j[k][l]-1)
          {
            l=l+1;
            checkdone=true;
          }
        }   
        way [k][l]=true;
      }
     if (k==sx && l==sy)
     {
       stroke (255,127,127);
       strokeWeight (0);
       fill (255);
       rect (0,500,400,100);
       fill (0);
       textSize (100);
       text ("MIN:"+j[49][49],0,600);
     }  
    } 
    else if (checkend)
    {
      stroke (255,127,127);
      strokeWeight (0);
      fill (255);
      rect (0,500,400,100);
      fill (0);
      textSize (100);
      text ("NO WAY",0,600);
    }    
    stroke (255,127,127);
    strokeWeight (0);
    fill (0,127,127);
    rect (400,500,100,100);
    fill (255,63,63);
    rect (420,515,25,70);
    rect (460,515,25,70);
    if (mousePressed && mouseX<500 && mouseY<500)
    {
      x=int(mouseX/10);
      y=int(mouseY/10);
      fill (255);
      rect (0,500,400,100);
      fill (0);
      textSize (100);
      text (j[x][y],0,600);
    }
  }
  else 
  {
    fill (0,127,127);
    rect (400,500,100,100);
    fill (127,255,127);
    triangle (425,512.5,425,587.5,487.5,550);
    if ((mousePressed && keyPressed && key=='E' && mouseX<500 && mouseY<500)
    || (mousePressed && keyPressed && key=='e' && mouseX<500 && mouseY<500))
    {
      x=int(mouseX/10);
      y=int(mouseY/10);
      i[x][y]=true;
      i[sx][sy]=false;
      i[dx][dy]=false;
    }
    if ((mousePressed && keyPressed && key=='W' && mouseX<500 && mouseY<500)
    || (mousePressed && keyPressed && key=='w' && mouseX<500 && mouseY<500))
    {
      x=int(mouseX/10);
      y=int(mouseY/10);
      i[x][y]=false;
      i[sx][sy]=false;
      i[dx][dy]=false;
    }
    if ((mousePressed && keyPressed && key=='S' && mouseX<500 && mouseY<500)
    || (mousePressed && keyPressed && key=='s' && mouseX<500 && mouseY<500))
    {
      x=int(mouseX/10);
      y=int(mouseY/10);
      sx=x;
      sy=y;
      i[sx][sy]=false;
      i[dx][dy]=false;
    }
    if ((mousePressed && keyPressed && key=='D' && mouseX<500 && mouseY<500)
    || (mousePressed && keyPressed && key=='d' && mouseX<500 && mouseY<500))
    {
      x=int(mouseX/10);
      y=int(mouseY/10);
      dx=x;
      dy=y;
      i[sx][sy]=false;
      i[dx][dy]=false;
    }
    if ((mousePressed && keyPressed && key=='Q' && mouseX<500 && mouseY<500)
    || (mousePressed && keyPressed && key=='q' && mouseX<500 && mouseY<500))
    {
      for (int a=0;a<50;a++)
      {
        for (int b=0;b<50;b++)
        {
          i[a][b]=true;
        }  
      } 
      sx=0;
      sy=0;
      dx=49;
      dy=49;
      i[sx][sy]=false;
      i[dx][dy]=false;
    }
    if ((mousePressed && keyPressed && key=='A' && mouseX<500 && mouseY<500)
    || (mousePressed && keyPressed && key=='a' && mouseX<500 && mouseY<500))
    {
      for (int a=0;a<50;a++)
      {
        for (int b=0;b<50;b++)
        {
          i[a][b]=false;
        }  
      } 
      sx=0;
      sy=0;
      dx=49;
      dy=49;
      i[sx][sy]=false;
      i[dx][dy]=false;
    }
    if ((mousePressed && keyPressed && key=='R' && mouseX<500 && mouseY<500)
    || (mousePressed && keyPressed && key=='r' && mouseX<500 && mouseY<500))
    {
      for (int a=0;a<50;a++)
      {
        for (int b=0;b<50;b++)
        {
          k=int (random(0,4));
          if (k==0)
          {
            i[a][b]=true;
          }  
          else
          {
            i[a][b]=false;
          }
        }  
      } 
      sx=0;
      sy=0;
      dx=49;
      dy=49;
      i[sx][sy]=false;
      i[dx][dy]=false;
    }
    
  }  
}  

void mouseClicked ()
{
  if (mouseX>400 && mouseX< 500 && mouseY>500)
  {
    check=!check;
    for (int a=0;a<50;a++)
    {
      for (int b=0;b<50;b++)
      {
        j[a][b]=0;
        way[a][b]=false;
      }
    }
    j[sx][sy]=1;  
    max=0;
    k=dx;
    l=dy;
    checkend=false;
  }  
}  

void find ()
{ 
  if (!checkend)
  {
    max=max+1;
    checkend=true;
    for (int a=0;a<50;a++)
    {
      for (int b=0;b<50;b++)
      {
        if (!i[a][b] && j[a][b]==0)
        {
          if (a==0 && b==0)
          {
            if (j[a+1][b]==max || j[a][b+1]==max)
            {
              j[a][b]=max+1;
              checkend=false;
            }  
          }
          else if (a==49 && b==0)
          {
            if (j[a-1][b]==max || j[a][b+1]==max)
            {
              j[a][b]=max+1;
              checkend=false;
            }  
          }
          else if (a==0 && b==49)
          {
            if (j[a+1][b]==max || j[a][b-1]==max)
            {
              j[a][b]=max+1;
              checkend=false;
            }  
          }
          else if (a==49 && b==49)
          {
            if (j[a-1][b]==max || j[a][b-1]==max)
            {
              j[a][b]=max+1;
              checkend=false;
            }  
          }
          else if (a==0)
          {
            if (j[a+1][b]==max || j[a][b+1]==max || j[a][b-1]==max)
            {
              j[a][b]=max+1;
              checkend=false;
            }  
          }
          else if (a==49)
          {
            if (j[a-1][b]==max || j[a][b+1]==max || j[a][b-1]==max)
            {
              j[a][b]=max+1;
              checkend=false;
            }  
          }
          else if (b==0)
          {
            if (j[a-1][b]==max || j[a+1][b]==max || j[a][b+1]==max)
            {
              j[a][b]=max+1;
              checkend=false;
            }  
          }
          else if (b==49)
          {
            if (j[a-1][b]==max || j[a+1][b]==max || j[a][b-1]==max)
            {
              j[a][b]=max+1;
              checkend=false;
            }  
          }
          else 
          {
            if (j[a-1][b]==max || j[a+1][b]==max || j[a][b+1]==max || j[a][b-1]==max)
            {
              j[a][b]=max+1;
              checkend=false;
            }  
          }
        }  
      }
    }  
  }
}  
