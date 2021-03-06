
int cartaSeleccionada =  -1;
public void Carta_click(Carta button, GEvent event) {
  println(button.id);
  cartaSeleccionada = button.id;
}
class Carta extends GImageButton {
  // field, constructor, and 
  // method declarations
  public int id = -1;
  public String descripcion = "";
  color col;

  Carta(PApplet ventana, float x, float y, float w, float h, String datos, String[] files) {
    super(ventana, x, y, w, h, files);
    addEventHandler(ventana, "Carta_click");
  }
  public void setDatos(String datos) {
    try {
      String[] spliter = split(datos, '%');
      id =Integer.valueOf( spliter[0]);
      descripcion = spliter[1];
      col = Integer.valueOf(spliter[2].trim());
      setVisible(true);
    }
    catch (Exception ex) {
    }
  }
  public void jugarCarta() {
    net_jugarCarta(id);
  }
  public void cartaAceptada() {
    id=-1;
  }
  public void descartarCarta() {
    net_descartarCarta(id);
  }
  public void draw() {
    if (id!=-1) {

      super.draw();
      if (cartaSeleccionada == id) {
        fill(0, 255, 255);
        rect(x+width*0.15, y+height*0.15, width*0.7, height*0.7);
      }
      fill(col);
      rect(x+width*0.25, y+height*0.10, width*0.5, height*0.05);
      fill(0);
      textSize(15);
      text(descripcion, x+width*0.15, y+height*0.15, width*0.7, height*0.7);
    } else {
    }
  }
}

Carta getbyID(int id) {
  if (id <0) return null;
  for (int j = 0; j < Cartas.size(); j++) {
    if (Cartas.get(j).id == id) {
      return Cartas.get(j);
    }
  }
  return null;
}