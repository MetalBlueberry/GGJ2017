class Jugador extends GImageButton {
  public int id = 0;
  public int[] atributos = new int[5];

  

  Jugador(PApplet ventana, float x, float y, float w, float h) {
    super(ventana, x, y, w, h, null);
    setVisible(false);
  }
  public void setId(int id) {
    println("id actualizada a; " +id);
    this.id=id;
  }
  public void setAtributos(int a1, int a2, int a3, int a4, int a5) {
    atributos[0] = a1;
    atributos[1] = a2;
    atributos[2] = a3;
    atributos[3] = a4;
    atributos[4] = a5;
  }
  public void draw() {
    if (id == 0) {
      textSize(22);
      text("Conectate al servidor", x+width*0.05, y+height*0.1);
    } else {
      textSize(22);
      text("Eres el jugador: "+id, x+width*0.05, y+height*0.1);
      
    }
  }
}