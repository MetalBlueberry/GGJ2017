
public void Jugador_click(GButton button, GEvent event) {
  if (cartaSeleccionada==-1) {
    return;
  }
  Carta c = getbyID(cartaSeleccionada);
  if (c!=null) {
    if (button.getText().startsWith("Jugar")) {   
      if (c!=null) {
        c.jugarCarta();
      }
    } else if (button.getText().startsWith("Descartar")) {
      c.descartarCarta();
    }
  }
}
class Jugador extends GImageButton {
  public int id = 0;
  public int[] atributos = new int[5];
  public int[] temporal = new int[5];
  public color col = color(0);

  GButton jugar; 
  GButton descartar;

  Jugador(PApplet ventana, float x, float y, float w, float h) {
    super(ventana, x, y, w, h, null);
    setVisible(false);

    jugar = new GButton(ventana, x+w*0.35, y+h*0.1, w*0.2, h*0.2);
    jugar.setText("Jugar");
    jugar.addEventHandler(ventana, "Jugador_click");
    descartar = new GButton(ventana, x+w*0.35, y+h*0.4, w*0.2, h*0.2);
    descartar.setText("Descartar");
    descartar.addEventHandler(ventana, "Jugador_click");
  }
  public void setId(int id) {
    println("id actualizada a; " +id);
    this.id=id;
  }
  public void setColor(color col) {
    this.col = col;
  }
  public void setAtributos(int a1, int a2, int a3, int a4, int a5) {
    atributos[0] = a1;
    atributos[1] = a2;
    atributos[2] = a3;
    atributos[3] = a4;
    atributos[4] = a5;
  }
  public void draw() {
    fill(0);
    rect(x, y, width*0.35, height);
    if (id == 0) {
      jugar.setVisible(false);
      descartar.setVisible(false);
      fill(255);
      textSize(height/6);
      text("Conectate al servidor", x+width*0.05, y+ height/5);
    } else {
      jugar.setVisible(true);
      descartar.setVisible(true);
      fill(255);
      textSize(height/7);
      for (int j  = 0; j< NombreCompleto.length; j++) {
        text(NombreCompleto[j], x+width*0.05, y+j*height/5 +height/7);
      }
      for (int j  = 0; j< NombreCompleto.length; j++) {
        text(atributos[j], x+width*0.25, y+j*height/5 +height/7);
      }
      for (int j  = 0; j< NombreCompleto.length; j++) {
        if (j==4) {
          text(atributos[j], x+width*0.25, y+j*height/5 +height/7);
        } else {
          text(atributos[j] + " + " + temporal[j], x+width*0.25, y+j*height/5 +height/7);
        }
      }

      // fill(255);
      // textSize(22);
      // text(id, x+width*0.01, y+height/5);
    }
  }
}