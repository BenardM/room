PImage fons1, fons2, fons3;
Bouton b1, b2, b3, b4;
int screen=1;

Temps chronometre;
void setup(){
  size(1024, 768);
  

  fons1 = loadImage("img/bomba.jpg");
  fons2 = loadImage("img/bum.jpg");
  fons3 = loadImage("img/victory.jpg");
  
  b1 = new Bouton(175, 70, color(255,0,0), 15, 40, 1, 1, "");
  b2 = new Bouton(190, 70, color(0,0,0), 15, 40, 1, 2, "");
  b3 = new Bouton(205, 70, color(0,0,255), 15, 40, 1, 1, "");
  b4 = new Bouton(220, 70, color(0,255,0), 15, 40, 1, 3, "");
   
  chronometre = new Temps();
}
void draw(){
  background(255,0,0);

    switch(screen){
    case 1: bomb();break;
    case 2: explosion();break;
    case 3: victory();break;
    }
  
   
  if (chronometre.endTimer()){
    screen = 2;
  }
     
}
void mousePressed(){
  b1.appuyer();
  b2.appuyer();
  b3.appuyer();
  b4.appuyer();
}
class Bouton {
  float xPos;
  float yPos;
  color c;
  float widthB;
  float heightB;
  int pantallaActual;
  int pantallaDesti; 
  PFont fontBouton;
  String texte;

  Bouton(){
    xPos = width/2;
    yPos = height/2;
    c = color(255,0,0);
    widthB = 50;
    heightB = 25;
    //pantall = écran
    pantallaActual = 1;
    pantallaDesti = 2;
    fontBouton = createFont("Georgia", 12);
    textFont(fontBouton);
    texte = "Boto";
  }
  Bouton(float x, float y, color col, float w, float h, int inici, int fi, String t){
    fontBouton = createFont("Georgia", 12);
    textFont(fontBouton);
    xPos = x;
    yPos = y;
    c = col;
    widthB = w;
    heightB = h;
    pantallaActual = inici;
    pantallaDesti = fi;
    texte = t;
  }
  
  void dibuixa(){
    noStroke();
    fill(c, 255);
    rect(xPos, yPos, widthB, heightB, 5);
    fill(255);
    text (texte, xPos + 10, yPos + 20);
  }
  
  void appuyer(){
    if ((xPos <= mouseX && mouseX <= xPos + widthB) && (yPos <= mouseY && mouseY <= yPos + heightB) && screen == pantallaActual){
      screen = pantallaDesti;
      chronometre.ReInitTimer(16);
    }
  }
}
class Temps{
  int TempEcouleDemarrage;
  int decompteur;
  PFont foncrono;
  Temps(){
    TempEcouleDemarrage = millis();
    decompteur = 600000 + TempEcouleDemarrage;
  }
  
  void ReInitTimer(int second){
    decompteur = millis() + second * 6000;
  }
  int seconds(){
    return (int)((millis() - TempEcouleDemarrage)/ 2000)%60;
  }
  int minutes(){
    return (int)((millis() - TempEcouleDemarrage)/ 60000);
  }
  
  int minuteTimer(){
      int resultat = (int)((decompteur-millis())/ 60000); 
      if (resultat < 0){
        resultat = 0;
      }
      return resultat;
  }
  
  int secondsTimer(){
    int resultat = (int)((decompteur-millis())/ 1000)%60;
    if (resultat < 0){
        resultat = 0;
      }
      return resultat; 
   }
  
  boolean endTimer(){
    return minuteTimer() == 0 && secondsTimer() == 0;
  }
  boolean limitChrono(int seg){
      return minutes()*60 + seconds() == seg;
  }
  
  void DisplayTimer(){
    fill(255, 0, 0);
    foncrono = createFont("Arial", 30);
    textFont(foncrono);
    text(minuteTimer()+":"+secondsTimer(), 175, 180);
  }
  void ReInit(){
    TempEcouleDemarrage = millis();
  }

}

void bomb(){
  image(fons1, 0, 0);
  chronometre.DisplayTimer();
  b1.dibuixa();
  b2.dibuixa();
  b3.dibuixa();
  b4.dibuixa();
}
void explosion(){
  image(fons2, 0, 0);
}
void victory(){
 
  image(fons3, 0, 0);
}