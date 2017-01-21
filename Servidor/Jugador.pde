class Jugador {
  Producto producto;
  MazoCartas mazo;
  String ip;
  int index;
  Jugador(Client c) {
    ip = c.ip();
    index = AutoIndex_Jugadores;
    c.write("jugador&"+index+'\n');
  }
  public void Robar(){
    mazo.Robar();
  }
}
class CartaModificador{
  int id;
  String descripcion = "";
  color col;
  
}