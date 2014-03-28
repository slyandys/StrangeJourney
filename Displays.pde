//int startTime;
//Give 3 Seconds' break for each sentences
void timer(String content)
{
  
  if(millis() < initTime + 2000)
  {
    pushStyle();
    fill(0);
    text(content, width / 2, height / 2);
    popStyle();
    if((dialog >= 23 && dialog <= 25) )
    {
      if(health>1)
        text("Health: " + health--, width / 2, height / 2+50);
      else
        text("Health: " + health, width / 2, height / 2+50);
    }
  }
  else
  {
    dialog++;
    initTime = millis();
    return;
  }
}
void displays()
{
  fill(0);
  textAlign(CENTER);
  textSize(30);
  text("Rescure the princess", width / 2, height / 2 - 50);
  text("Press ENTER to start~", width / 2, height / 2);
}
void displaysItemState()
{
  fill(200);
  //tint(255, 10);
  textAlign(CENTER);
  textSize(30);
  text("Health: " + health , width / 2, height / 2+50);
}

/*
The story....
*/
void scenStart()
{
  switch(dialog)
  {
    case 0:timer("Once upon a time");break;
    case 1:timer("A princess has been captured by a monster,");break;
    case 2:timer("Everyone wants to save her,");break;
    case 3:timer("yet no one can do it.");break;
    case 4:timer("Until a slow-witted shows up...");break;
    case 5:timer("Slow-witted:Hey, what are you doing there?");break;
    case 6:timer("I was catched by a monster many years ago.");break;
    case 7:timer("Slow-witted:Oh, ....bye.");break;
    case 8:timer("Princess: Don't you want to rescure me?");break;
    case 9:timer("Slow-witted:Oh, right...But, what can I do?");break;
    case 10:timer("Princess: ehhhhh..I heard that the monster need a THING,");break;
    case 11:timer("but I am not sure what it is....");break;
    case 12:timer("I think it will let me go if you can find it.");break;
    case 13:timer("Slow-witted:Ok. So...I am going to find it. See you later~");break;
    case 14:timer("Princess: ...........");break;
//    case 11:timer("but I am not sure what it is....I think it will let me go if you can find it.");break;
  }
}
void SceneTheHits()
{
  switch(dialog)
  {
    case 15:timer("Slow-witted: Where am I.");break;
    case 16:timer("NO-ONE: You MUST pass through The Ordeal.");break;
    case 17:timer("Slow-witted: These boxes?");break;
    case 18:timer("NO-ONE: These hits!!~~Here it comes..");break;
    case 19:timer("(NB:USE w,a,d TO MOVE, TRY NOT TO BE HIT TOO MUCH..FYI)");break;
  }
}
void SceneThing()
{
  switch(dialog)
  {
    case 20:timer("WOWOWOW");break;
    case 21:timer("Slow-witted: I'm shuffling~!!. What's that?");break;
    case 22:timer("(NB:Draw a path guiding him to the 'THING')");break;
    //After touch the thing...
  }
}
void SceneOver()
{
  switch(dialog)
  {
    case 23:timer("Slow-witted: Holy Moly!!!....");break;
    case 24:timer("Slow-witted: Holy Moly!!!....");break;
    case 25:timer("NO-ONE: You've got the THING");break;
    case 26:timer("But the princess....");break;
    case 27:timer("Slow-witted: What happen to her?");break;
    case 28:timer("NO-ONE: You can see by yourself");break;
    case 29:timer("But you have to pass again that path..");break;
    case 30:timer("NB:You now can drag the slow-witted");break;
    case 31:timer("Use 'f' to Frozze the Generator~");break;
  }
}

void SceneEnding()
{
  switch(dialog)
  {
    case 32:timer("Princess:Amazing...");break;
    case 33:timer("You are back.");break;
    case 34:timer("Actually...");break;
    case 35:timer("I am the monster");break;
    case 36:timer("See you ..my dear~~hahahaha");break;
    case 37:timer("To Be Continued..");break;
    case 38:health = 0;break;
  }
}

////Prologue:
//Once upon a time,
//A princess has been captured by a monster,
//Everyone wants to save her,
//Yet no one can do it,
//Until a slow-witted shows up,
//*******
////Scene 1
//Slow-witted:Hey, what are you doing there?
//Princess: I was catched by a monster many years ago.
//Slow-witted:Oh, ....bye.
//Princess: Don't you want to rescure me?
//Slow-witted:Oh, right...But, what can I do?
//Princess: ehhhhh..I heard that the monster need a THING, but I am not sure what it is....I think it will let me go if you can find it.
//Slow-witted: Ok. So...I am going to find it. See you later~
//Princess: ...........
//*******
////Scene 2
//Slow-witted: Where am I.
//NO-ONE: You MUST pass through The Ordeal.
//Slow-witted: These boxes?
//NO-ONE: These hits!!~~Here it comes..
//
//(Notes: USE w,a,d TO MOVE, TRY NOT TO BE HIT TOO MUCH
//FYI)
//****
////Scene 3
//Slow-witted: I'm shuffling~!!. What's that?
//(Notes: Guide him to the 'THING' by blocking out a path, USE THE MOUSE)
//
////Scene 3 - After hit the THING
//(Health drop down to 1)
//Slow-witted: Holy Moly!!!....
//
////Scene 4 - Return
////Slow-witted:
//Game OVER
//
//To be continued...



void GameOver(){
  fill(0);
  textAlign(CENTER);
  textSize(40);
  text("GAME OVER", width / 2, height / 2 - 50);
  text("Press R to restart~", width / 2, height / 2);
}
