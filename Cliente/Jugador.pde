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
  public void draw(){
    text("Mi id es: "+id,width*0.05,height*0.5);
  }
}