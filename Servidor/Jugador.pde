

MazoCartas<CartaModificador> mazoJugadores = new MazoCartas<CartaModificador>();  
class Jugador {
  Producto producto;
  MazoCartas<CartaModificador> mazo;

    List<CartaModificador> efectos;
  List<CartaModificador> temporal;

  public String ip;
  int index;
  Jugador(Client c) {
    ip = c.ip();
    index = AutoIndex_Jugadores;
    AutoIndex_Jugadores++;
    c.write("jugador&"+index+'\n');   
    mazo = new MazoCartas<CartaModificador>(mazoJugadores);
    mazo.Reiniciar();
    for(int j = 0; j < 10; j++){
    Robar(c);
    }
  }
  public void Robar(Client c) {
    CartaModificador carta = mazo.Robar();
    println(carta.Send());
    c.write(carta.Send());
  }
  public void Atributos(Client c) {
    
  }
}

class CartaModificador {
  public int id;
  public String descripcion = "";
  public color col;

  public int duracion = -1;
  public float multiplicador = 1;
  public Stats atributo;

  CartaModificador() {
    atributo = new Stats(0, 0, 0, 0);
    id = AutoIndex_CartaJugador;
    AutoIndex_CartaJugador++;
  }
  public String Send() {
    return "carta&"+id +"%" +descripcion +"%"+col +"\n";
  }
}