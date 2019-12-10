class CaseMenu {

  //---------------------------------------------Variables

  int x, y;
  int taille;
  color couleur = color(0,255,0);
  int sombre;
  
  boolean grasse=true;


  //---------------------------------------------Constructeur

  CaseMenu(int x, int y, int taille) {
    this.x=x;
    this.y=y;
    this.taille=taille;
    sombre=(int)random(50, 80);
  }
  
  //---------------------------------------------setter grasse
  void setGrasse(boolean in){
    this.grasse=in;
  }
  
  //---------------------------------------------setter couleur grasse
  void setColor(color in){
    this.couleur=in;
  }

  //---------------------------------------------Affichage

  void affiche() {
    
    if(grasse){
      fill(couleur);
      rect(x,y,taille,taille);
    }else{
      fill(51);
      rect(x,y,taille,taille);
      fill(#D3914B, sombre);
      rect(x, y, taille, taille);
    }
  }
}
