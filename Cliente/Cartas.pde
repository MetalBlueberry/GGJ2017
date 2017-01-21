


class Carta extends GImageButton {
  // field, constructor, and 
  // method declarations
  public int id = -1;
  public String descripcion;
  color col;
  
  Carta(PApplet ventana, float x, float y, float w, float h, String datos) {
    super(ventana, x, y, w, h, null);
  }
  public void setDatos(String datos) {
    try{
    String[] spliter = split(datos,'%');
    id =Integer.valueOf( spliter[0]);
    descripcion = spliter[1];
    col = color(Integer.valueOf(spliter[2]));
    }catch (Exception ex){
      
    }
  }
  public void draw() {
    if (id!=-1) {
      setVisible(true);
      rect(x, y, width, height);
      text(descripcion, x+width*0.1, y+height*0.1, width*0.8, height*0.8);
    } else {
      setVisible(false);
    }
  }
}