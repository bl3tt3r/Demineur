//---------------------------------------------Variables des menus
int hauteurMenu=100;
boolean menu = true;

//tableau fond niveau menu

ArrayList<ArrayList<CaseMenu>> niv1 = new ArrayList<ArrayList<CaseMenu>>();
ArrayList<ArrayList<CaseMenu>> niv2 = new ArrayList<ArrayList<CaseMenu>>();
ArrayList<ArrayList<CaseMenu>> niv3 = new ArrayList<ArrayList<CaseMenu>>();

//couleur texte niveau menu

color couleurText1 = color(51);
color couleurText2 = color(51);
color couleurText3 = color(51);

//couleur bouton reset

color boutonReset = color(200);

//image bouton reset

PImage exit;

//---------------------------------------------Variables des cases
int taille;
ArrayList<ArrayList<Case>> lignes = new ArrayList<ArrayList<Case>>();
int nbBombes;
boolean first=true;
boolean setNumFinish=false;
int timer=0;

//---------------------------------------------Variables infos
int milli ;
boolean firstMilli=true;
boolean Win=false, Lose=false;



//---------------------------------------------Boucle de setup
void setup() {
  size(600, 700);
  textSize(16);

  setupMenu();

  exit = loadImage("images/exit.png");
  exit.resize(hauteurMenu-50, hauteurMenu-50);
}

//---------------------------------------------Boucle de jeu
void draw() {
  background(51);
  if (menu) {
    menu();
  } else {

    setCouleur();
    afficheCase();

    if (first && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height-hauteurMenu && lignes.get(mouseX/taille).get(mouseY/taille).isVide()) { 
      setNum();
      setNumFinish=true;
      fingVide();
    } else {
      if (!first) {
        setNum();
        setNumFinish=true;
      }
    }

    affichageInfos();

    winLose();
  }
  
  fill(70);
  textSize(10);
  text("created by rudy david",width/2-50,height-1);
  textSize(16);
}

//---------------------------------------------Boucle de creation des fond : niveau du menu
void setupMenu(){
  
 
  int cpt=0;

  for (int l=0; l<(height-hauteurMenu)/3; l+=50) {
    niv1.add(new ArrayList<CaseMenu>());
    for (int c=0; c<width; c+=50) {
      niv1.get(cpt).add(new CaseMenu(c, l, 50));
    }
    cpt++;
  }

  cpt=0;

  for (int l=0; l<(height-hauteurMenu)/3; l+=30) {
    niv2.add(new ArrayList<CaseMenu>());
    for (int c=0; c<width; c+=30) {
      niv2.get(cpt).add(new CaseMenu(c, l+((height-hauteurMenu)/3), 30));
    }
    cpt++;
  }

  cpt=0;

  for (int l=0; l<(height-hauteurMenu)/3; l+=15) {
    niv3.add(new ArrayList<CaseMenu>());
    for (int c=0; c<width; c+=15) {
      niv3.get(cpt).add(new CaseMenu(c, (l+((height-hauteurMenu)/3)*2), 15));
    }
    cpt++;
  }


  for (int l=0; l<niv1.size(); l++) {
    for (int c=0; c<niv1.get(l).size(); c++) {
      if (l%(2)==0) {
        if (c%(2)==0) {
          niv1.get(l).get(c).setColor(color(0, 255, 0));
        } else {
          niv1.get(l).get(c).setColor(color(0, 200, 0));
        }
      } else {
        if (c%(2)==0) {
          niv1.get(l).get(c).setColor(color(0, 200, 0));
        } else {
          niv1.get(l).get(c).setColor(color(0, 255, 0));
        }
      }
    }
  }

  for (int l=0; l<niv2.size(); l++) {
    for (int c=0; c<niv2.get(l).size(); c++) {
      if (l%(2)==0) {
        if (c%(2)==0) {
          niv2.get(l).get(c).setColor(color(0, 255, 0));
        } else {
          niv2.get(l).get(c).setColor(color(0, 200, 0));
        }
      } else {
        if (c%(2)==0) {
          niv2.get(l).get(c).setColor(color(0, 200, 0));
        } else {
          niv2.get(l).get(c).setColor(color(0, 255, 0));
        }
      }
    }
  }

  for (int l=0; l<niv3.size(); l++) {
    for (int c=0; c<niv3.get(l).size(); c++) {
      if (l%(2)==0) {
        if (c%(2)==0) {
          niv3.get(l).get(c).setColor(color(0, 255, 0));
        } else {
          niv3.get(l).get(c).setColor(color(0, 200, 0));
        }
      } else {
        if (c%(2)==0) {
          niv3.get(l).get(c).setColor(color(0, 200, 0));
        } else {
          niv3.get(l).get(c).setColor(color(0, 255, 0));
        }
      }
    }
  } 
  
}

//---------------------------------------------Affichage du menu

void menu() {
  fill(255);
  stroke(0);
  rect(0, 0, width, (height-hauteurMenu)/3);
  rect(0, (height-hauteurMenu)/3, width, (height-hauteurMenu)/3);
  rect(0, ((height-hauteurMenu)/3)*2, width, (height-hauteurMenu)/3);
  fill(0);
  textSize(110);

  //affichage des fond : niveau

  for (ArrayList<CaseMenu> ligne : niv1) {
    for (CaseMenu element : ligne) {
      element.affiche();
    }
  }

  for (ArrayList<CaseMenu> ligne : niv2) {
    for (CaseMenu element : ligne) {
      element.affiche();
    }
  }

  for (ArrayList<CaseMenu> ligne : niv3) {
    for (CaseMenu element : ligne) {
      element.affiche();
    }
  }

  fill(couleurText1);
  text("Niveau 1", 70, ((height-hauteurMenu)/3)-60);
  fill(couleurText2);
  text("Niveau 2", 70, ((height-hauteurMenu)/3)*2-60);
  fill(couleurText3);
  text("Niveau 3", 70, ((height-hauteurMenu)/3)*3-60);
  fill(222);
  textSize(90);
  text("Démineur", 90, height-10);
  textSize(16);
}

//---------------------------------------------Controller souris

void affichageInfos() {

  //---------------------------------------------Bouton reset

  fill(boutonReset);
  rect(width-hauteurMenu+10, height-hauteurMenu+10, hauteurMenu-20, hauteurMenu-20);
  fill(0);

  image(exit, width-hauteurMenu+20, height-hauteurMenu+25);

  //---------------------------------------------nombre de bombes

  fill(255);
  text("nombre de bombes : "+nbBombes, 10, height-hauteurMenu+30);

  //---------------------------------------------compteur temp  

  if (firstMilli) {
    milli=millis();
    firstMilli=false;
  }

  fill(255);
  if (Win || Lose) {
    text("temps ecoulé : "+timer, 10, height-hauteurMenu+50);
  } else {
    text("temps ecoulé : "+(millis()-milli)/1000, 10, height-hauteurMenu+50);
    timer=(millis()-milli)/1000;
  }
}

//---------------------------------------------Affichage des cases

void afficheCase() {
  for (ArrayList<Case> ligne : lignes) {
    for (Case element : ligne) {
      element.affiche();
    }
  }
}

//---------------------------------------------creation des numeros

void setNum() {
  for (int l=0; l<lignes.size(); l++) {
    for (int c=0; c<lignes.get(l).size(); c++) {
      int nbB=0;
      if (l!=0 && c!=0 && lignes.get(l-1).get(c-1).isBomb()) {
        nbB++;
      }
      if (l!=0 && lignes.get(l-1).get(c).isBomb()) {
        nbB++;
      }
      if (l!=0 && c<lignes.get(l).size()-1 && lignes.get(l-1).get(c+1).isBomb()) {
        nbB++;
      }
      if (c!=0 && lignes.get(l).get(c-1).isBomb()) {
        nbB++;
      }
      if (c<lignes.get(l).size()-1) {
        if ( lignes.get(l).get(c+1).isBomb()) {
          nbB++;
        }
      }
      if (c<lignes.get(l).size()-1 && l<lignes.size()-1 && lignes.get(l+1).get(c+1).isBomb()) {
        nbB++;
      }
      if (l<lignes.size()-1 && lignes.get(l+1).get(c).isBomb()) {
        nbB++;
      }
      if (l<lignes.size()-1 && c!=0 && lignes.get(l+1).get(c-1).isBomb()) {
        nbB++;
      }

      if (nbB>0) {
        lignes.get(l).get(c).setNum(nbB);
      }
    }
  }
}

//---------------------------------------------Cherche si il y a une bombe a une case d'un element

boolean findBomb(int l, int c) {

  println("ligne = "+l+" colonne = "+c);

  int nbB=0;

  if (l!=0 && c!=0 && lignes.get(l-1).get(c-1).isBomb()) {
    nbB++;
  }
  if (l!=0 && lignes.get(l-1).get(c).isBomb()) {
    nbB++;
  }
  if (l!=0 && c<lignes.get(l).size()-1 && lignes.get(l-1).get(c+1).isBomb()) {
    nbB++;
  }
  if (c!=0 && lignes.get(l).get(c-1).isBomb()) {
    nbB++;
  }
  if (c<lignes.get(l).size()-1) {
    if ( lignes.get(l).get(c+1).isBomb()) {
      nbB++;
    }
  }
  if (c<lignes.get(l).size()-1 && l<lignes.size()-1 && lignes.get(l+1).get(c+1).isBomb()) {
    nbB++;
  }
  if (l<lignes.size()-1 && lignes.get(l+1).get(c).isBomb()) {
    nbB++;
  }
  if (l<lignes.size()-1 && c!=0 && lignes.get(l+1).get(c-1).isBomb()) {
    nbB++;
  }

  if (nbB!=0) {
    return true;
  } else {
    return false;
  }
}

//---------------------------------------------Reset

void reset() {
  menu=true; //re-affichage du menu
  firstMilli=true;//reset du compteur
  first=true;
  setNumFinish=false;
  Win=false;
  Lose=false;
}

//---------------------------------------------configuration

void config(int in) {
  menu=false;
  lignes.clear();
  taille=in;
  int cpt=0;
  for (int l=0; l<height-hauteurMenu; l+=taille) {
    lignes.add(new ArrayList<Case>());
    for (int c=0; c<width; c+=taille) {
      //print(c+";");
      lignes.get(cpt).add(new Case(c, l, taille));
    }
    //print('\n');
    cpt++;
  }

  for (int i=0; i<nbBombes; i++) {
    while (lignes.get((int)random(0, lignes.size())).get((int)random(0, lignes.get(2).size())).setBombe()==false) {
    };//verification qu'une bombe n'est pas placé sur une autre
  }
}

//---------------------------------------------Controller souris pour controle du survole des elements

void mouseMoved() {
  if (mouseX>0 && mouseX<width) {
    if (mouseY>0 && mouseY< (height-hauteurMenu)/3) {
      for (ArrayList<CaseMenu> ligne : niv1) {
        for (CaseMenu element : ligne) {
          element.setGrasse(false);
          couleurText1=color(200);
        }
      }
    } else {
      for (ArrayList<CaseMenu> ligne : niv1) {
        for (CaseMenu element : ligne) {
          element.setGrasse(true);
          couleurText1=color(51);
        }
      }
    }

    if (mouseY>(height-hauteurMenu)/3 && mouseY<(height-hauteurMenu)/3*2) {
      for (ArrayList<CaseMenu> ligne : niv2) {
        for (CaseMenu element : ligne) {
          element.setGrasse(false);
          couleurText2=color(200);
        }
      }
    } else {
      for (ArrayList<CaseMenu> ligne : niv2) {
        for (CaseMenu element : ligne) {
          element.setGrasse(true);
          couleurText2=color(51);
        }
      }
    }

    if (mouseY>(height-hauteurMenu)/3*2 && mouseY<(height-hauteurMenu)) {
      for (ArrayList<CaseMenu> ligne : niv3) {
        for (CaseMenu element : ligne) {
          element.setGrasse(false);
          couleurText3=color(200);
        }
      }
    } else {
      for (ArrayList<CaseMenu> ligne : niv3) {
        for (CaseMenu element : ligne) {
          element.setGrasse(true);
          couleurText3=color(51);
        }
      }
    }
  }

  if (mouseX>width-hauteurMenu+10 && mouseX<width-10 && mouseY>height-hauteurMenu+10 && mouseY<height-10) { //---------------------------------------------Controller souris bouton reset
    boutonReset=color(150);
  } else {
    boutonReset=color(200);
  }
}

void mousePressed() {

  if (menu) {    //---------------------------------------------Controller souris menu
    if (mouseX>0 && mouseX<width) {
      if (mouseY>0 && mouseY< (height-hauteurMenu)/3) {
        println("niveau 1 selectionner");
        nbBombes=15;
        config(50);
      } else if (mouseY>(height-hauteurMenu)/3 && mouseY<(height-hauteurMenu)/3*2) {
        println("niveau 2 selectionner");
        nbBombes=30;
        config(30);
      } else if (mouseY>(height-hauteurMenu)/3*2 && mouseY<(height-hauteurMenu)) {
        println("niveau 3 selectionner");
        nbBombes=150;
        config(15);
      }
    }
  } else {

    if ( (!Win && !Lose ) || mouseY>height-hauteurMenu) {

      if (mouseX>width-hauteurMenu+10 && mouseX<width-10 && mouseY>height-hauteurMenu+10 && mouseY<height-10) { //---------------------------------------------Controller souris bouton reset
        reset();
      }

      if (mouseX>0 && mouseX<width && mouseY>0 && mouseY<height-hauteurMenu) {
        if (mouseButton == RIGHT) { //---------------------------------------------Creation des flag
          lignes.get(mouseY/taille).get(mouseX/taille).changeFlag();
        }

        if (mouseButton == LEFT ) { //---------------------------------------------Ouverture des cases

          if (first) {
            while (findBomb(mouseY/taille, mouseX/taille)) {

              print("bombe find");

              for (int l=0; l<lignes.size(); l++) {
                for (int c=0; c<lignes.get(l).size(); c++) {
                  lignes.get(l).get(c).notBombe();
                  lignes.get(l).get(c).setNum(-1);
                }
              }

              for (int i=0; i<nbBombes; i++) {
                while (lignes.get((int)random(0, lignes.size())).get((int)random(0, lignes.get(2).size())).setBombe()==false) {
                };//verification qu'une bombe n'est pas placé sur une autre
              }

              setNum();
            }
          }

          if (lignes.get(mouseY/taille).get(mouseX/taille).open() && first) {
            lignes.get(mouseY/taille).get(mouseX/taille).notBombe();
            Case element=lignes.get((int)random(0, lignes.size())).get((int)random(0, lignes.get(2).size()));
            while (element.setBombe()==false && element.isIN(mouseX, mouseY) ) {
              element=lignes.get((int)random(0, lignes.size())).get((int)random(0, lignes.get(2).size()));
            }

            for (int l=0; l<lignes.size(); l++) {
              for (int c=0; c<lignes.get(l).size(); c++) {
                lignes.get(l).get(c).setNum(-1);
              }
            }

            setNum();
          }





          first=false;

          if (lignes.get(mouseY/taille).get(mouseX/taille).isVide() && setNumFinish) {
            fingVide();
          }
        }
      }
    }
  }
}

void setCouleur() { //set la couleur vert des case du demineur

  for (int l=0; l<lignes.size(); l++) {
    for (int c=0; c<lignes.get(l).size(); c++) {
      if (l%(2)==0) {
        if (c%(2)==0) {
          lignes.get(l).get(c).setColor(color(0, 255, 0));
        } else {
          lignes.get(l).get(c).setColor(color(0, 200, 0));
        }
      } else {
        if (c%(2)==0) {
          lignes.get(l).get(c).setColor(color(0, 200, 0));
        } else {
          lignes.get(l).get(c).setColor(color(0, 255, 0));
        }
      }
    }
  }
}



void fingVide() { // revele toutes les case vide a coté d'une case vide


  boolean trouver=true;

  while (trouver) {

    trouver=false;

    for (int l=0; l<lignes.size(); l++) {
      for (int c=0; c<lignes.get(l).size(); c++) {
        if (!lignes.get(l).get(c).isBomb() && !lignes.get(l).get(c).isNum() ) {
          if (l!=0 && c!=0 && lignes.get(l-1).get(c-1).isVide() && lignes.get(l-1).get(c-1).Visible()==false && !lignes.get(l-1).get(c-1).isBomb() && lignes.get(l).get(c).Visible()) {
            trouver=true;
            lignes.get(l-1).get(c-1).open();
          }
          if (l!=0 && lignes.get(l-1).get(c).isVide() && lignes.get(l-1).get(c).Visible()==false && !lignes.get(l-1).get(c).isBomb() && lignes.get(l).get(c).Visible()) {
            trouver=true;
            lignes.get(l-1).get(c).open();
          }
          if (l!=0 && c<lignes.get(l).size()-1 && lignes.get(l-1).get(c+1).isVide() && lignes.get(l-1).get(c+1).Visible()==false && !lignes.get(l-1).get(c+1).isBomb() && lignes.get(l).get(c).Visible()) {
            trouver=true;
            lignes.get(l-1).get(c+1).open();
          }
          if (c!=0 && lignes.get(l).get(c-1).isVide() && lignes.get(l).get(c-1).Visible()==false && !lignes.get(l).get(c-1).isBomb() && lignes.get(l).get(c).Visible()) {
            trouver=true;
            lignes.get(l).get(c-1).open();
          }
          if (c<lignes.get(l).size()-1) {
            if ( lignes.get(l).get(c+1).isVide() && lignes.get(l).get(c+1).Visible()==false && !lignes.get(l).get(c+1).isBomb() && lignes.get(l).get(c).Visible()) {
              trouver=true;
              lignes.get(l).get(c+1).open();
            }
          }
          if (c<lignes.get(l).size()-1 && l<lignes.size()-1 && lignes.get(l+1).get(c+1).isVide() && lignes.get(l+1).get(c+1).Visible()==false && !lignes.get(l+1).get(c+1).isBomb() && lignes.get(l).get(c).Visible()) {
            trouver=true;
            lignes.get(l+1).get(c+1).open();
          }
          if (l<lignes.size()-1 && lignes.get(l+1).get(c).isVide() && lignes.get(l+1).get(c).Visible()==false && !lignes.get(l+1).get(c).isBomb() && lignes.get(l).get(c).Visible()) {
            trouver=true;
            lignes.get(l+1).get(c).open();
          }
          if (l<lignes.size()-1 && c!=0 && lignes.get(l+1).get(c-1).isVide() && lignes.get(l+1).get(c-1).Visible()==false && !lignes.get(l+1).get(c-1).isBomb() && lignes.get(l).get(c).Visible()) {
            trouver=true;
            lignes.get(l+1).get(c-1).open();
          }
        }
      }
    }
  }
  revelNum();
}

void revelNum() {//revele tous les numeros a coté d'un case vide

  for (int l=0; l<lignes.size(); l++) {
    for (int c=0; c<lignes.get(l).size(); c++) {

      if (lignes.get(l).get(c).isVide()) {

        if (l!=0 && c!=0 && lignes.get(l-1).get(c-1).Visible()==false && !lignes.get(l-1).get(c-1).isBomb() && lignes.get(l).get(c).Visible()) {

          lignes.get(l-1).get(c-1).open();
        }
        if (l!=0 && lignes.get(l-1).get(c).Visible()==false && !lignes.get(l-1).get(c).isBomb() && lignes.get(l).get(c).Visible()) {

          lignes.get(l-1).get(c).open();
        }
        if (l!=0 && c<lignes.get(l).size()-1 && lignes.get(l-1).get(c+1).Visible()==false && !lignes.get(l-1).get(c+1).isBomb() && lignes.get(l).get(c).Visible()) {

          lignes.get(l-1).get(c+1).open();
        }
        if (c!=0 && lignes.get(l).get(c-1).Visible()==false && !lignes.get(l).get(c-1).isBomb() && lignes.get(l).get(c).Visible()) {

          lignes.get(l).get(c-1).open();
        }
        if (c<lignes.get(l).size()-1) {
          if ( lignes.get(l).get(c+1).Visible()==false && !lignes.get(l).get(c+1).isBomb() && lignes.get(l).get(c).Visible()) {

            lignes.get(l).get(c+1).open();
          }
        }
        if (c<lignes.get(l).size()-1 && l<lignes.size()-1 && lignes.get(l+1).get(c+1).Visible()==false && !lignes.get(l+1).get(c+1).isBomb() && lignes.get(l).get(c).Visible()) {

          lignes.get(l+1).get(c+1).open();
        }
        if (l<lignes.size()-1  && lignes.get(l+1).get(c).Visible()==false && !lignes.get(l+1).get(c).isBomb() && lignes.get(l).get(c).Visible()) {

          lignes.get(l+1).get(c).open();
        }
        if (l<lignes.size()-1 && c!=0 && lignes.get(l+1).get(c-1).Visible()==false && !lignes.get(l+1).get(c-1).isBomb() && lignes.get(l).get(c).Visible()) {

          lignes.get(l+1).get(c-1).open();
        }
      }
    }
  }
}

void revelAll() { // revele toutes les case
  for (int l=0; l<lignes.size(); l++) {
    for (int c=0; c<lignes.get(l).size(); c++) {
      lignes.get(l).get(c).open();
    }
  }
}

void winLose() { // determine si le joueur a win ou lose

  int localCpt=0;
  boolean lose=false;

  for (int l=0; l<lignes.size(); l++) {
    for (int c=0; c<lignes.get(l).size(); c++) {
      if (lignes.get(l).get(c).isBomb() && lignes.get(l).get(c).Visible()) {
        lose=true;
      }
      if (!lignes.get(l).get(c).Visible()) {
        localCpt++;
      }
    }
  }

  if (lose) {
    Lose=true;
    revelAll();
    fill(255);
    text("Perdu", 10, height-hauteurMenu+70);
  }

  if (localCpt==nbBombes) {
    Win=true;
    text("Gagné", 10, height-hauteurMenu+70);
  }
}
