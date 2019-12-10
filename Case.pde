class Case {

  //---------------------------------------------Variables

  int x, y;
  boolean bombe=false;
  boolean flag=false;
  boolean visible=false;//variable d'affichage des cases
  int number=-1;
  int taille;
  color couleur;
  int sombre;
  PImage tete = loadImage("images/tete.png");

  //---------------------------------------------Constructeur

  Case(int x, int y, int taille) {
    this.x=x;
    this.y=y;
    this.taille=taille;
    sombre=(int)random(50, 80);
  }

  //---------------------------------------------Affichage

  void affiche() {
    if (visible) {
      if (bombe) {  //---------------------------------------------Bombe
        fill(#D3914B, sombre);
        rect(x, y, taille, taille);
        fill(255, 0, 0);
        ellipse(x+taille/2, y+taille/2, taille, taille);
        tete.resize(taille/10*8, taille/10*8);
        image(tete, x+(((taille/10)+1)*1), y+(((taille/10)+1)*1));
      } else {  //---------------------------------------------Num

        if (number==-1) {
          fill(#D3914B, sombre);
          rect(x, y, taille, taille);
        } else {
          fill(#D3914B, sombre);
          rect(x, y, taille, taille);
          if (number==1) {          
            fill(#99B4ED);
          }
          if (number==2) {
            fill(#99EDB1);
          }
          if (number==3) {
            fill(#F79178);
          }
          if (number==4) {
            fill(#F5F778);
          }
          if (number==5) {
            fill(#86F778);
          }
          if (number==6) {
            fill(#78F7DF);
          }
          if (number==7) {
            fill(#DF78F7);
          }
          if (number==8) {
            fill(#78A1F7);
          }

          textSize(taille); 
          text(number, x+(taille/8), y+taille);
          textSize(16);
        }
      }
    } else if (flag) {
      fill(couleur);
      rect(x, y, taille, taille);
      fill(255, 0, 0);
      triangle(x+(taille/10), y+(taille/10)*3, x+taille-(taille/10), y+(taille/10), x+taille-(taille/10), y+(taille/10)*6);
      line(x+taille-(taille/10), y+taille/10, x+taille-(taille/10), y+taille-(taille/10));
    } else {  //---------------------------------------------Non visible
      fill(couleur);
      rect(x, y, taille, taille);
    }
  }

  //---------------------------------------------Setter bombes
  void setColor(color in) {
    this.couleur=in ;
  }
  //---------------------------------------------Setter bombes

  boolean setBombe() {
    if (bombe) {
      return false;
    } else {
      this.bombe=true;
      return true;
    }
  }

  void notBombe() {
    bombe=false;
  }

  boolean isBomb() {
    if (bombe) {
      return true;
    } else {
      return false;
    }
  }

  //---------------------------------------------getter visible
  boolean Visible() {
    return visible;
  }

  //---------------------------------------------getter vide
  boolean isVide() {
    if (number==-1) {
      return true;
    } else {
      return false;
    }
  }

  //---------------------------------------------Setter visible

  boolean open() {
    if (!flag) {
      this.visible=true;
    }
    if (bombe) {
      return true;
    } else {
      return false;
    }
  }

  //---------------------------------------------Setter and getter numero

  void setNum(int num) {
    this.number=num;
  }

  boolean isNum() {
    if (number>0) {
      return true;
    } else {
      return false;
    }
  }

  //---------------------------------------------Savoir si un clic appartient a une case

  boolean isIN(int inx, int iny) {
    if (inx>x && inx<x+taille && iny>y && iny<y+taille) {
      return true;
    } else {
      return false;
    }
  }

  //---------------------------------------------Setter flag

  void changeFlag() {
    if (this.flag) {
      this.flag=false;
    } else {
      this.flag=true;
    }
  }
}
