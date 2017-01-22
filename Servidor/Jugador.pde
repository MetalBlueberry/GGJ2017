
color[] coloresJugadores = {color(255, 0, 0), color(0, 255, 0), color(0, 0, 255), color(255, 255, 0), color(255, 0, 255), color(0, 255, 255)};
MazoCartas<CartaModificador> mazoJugadores = new MazoCartas<CartaModificador>();  
class Jugador {
  Producto producto;
  MazoCartas<CartaModificador> mazo;
  List<CartaModificador> mano = new ArrayList<CartaModificador>();

  List<CartaModificador> efectos = new ArrayList<CartaModificador>();
  List<CartaModificador> temporal = new ArrayList<CartaModificador>();

  public String ip = "";
  int index;
  Jugador(Client c) {
    ip = c.ip();
    index = AutoIndex_Jugadores;
    AutoIndex_Jugadores++;
    c.write("jugador&"+index+"&"+coloresJugadores[index-1]+'\n');   
    mazo = new MazoCartas<CartaModificador>(mazoJugadores);
    mazo.Reiniciar();
    for (int j = 0; j < 10; j++) {
      Robar(c);
    }
  }
  public void Robar(Client c) {
    CartaModificador carta = mazo.Robar();
    mano.add(carta);
    println(carta.Send());
    c.write(carta.Send());
  }
  public Stats Atributos(Client c) {
    Stats temp = new Stats(0,0,0,0);
    for(int j = 0; j < efectos.size(); j++){
      temp.add(efectos.get(j).atributo);
    }
    c.write(temp.send());
    return temp;
  }

  public void jugarCarta(Client c, String carta) {
    int cartaId = Integer.valueOf(carta.trim());
    println("jugando carta "+cartaId);
    for (int j = 0; j < mano.size(); j++) {
      CartaModificador card = mano.get(j);
      if (card.id == cartaId) {
         println("carta encontrada "+cartaId);
        mano.remove(card);
        aplicar(card);
        c.write(card.jugada());
        break;
      }
    }
  }
  public void descartarCarta(Client c, String carta) {
    int cartaId = Integer.valueOf(carta.trim());
    for (int j = 0; j < mano.size(); j++) {
      CartaModificador card = mano.get(j);
      if (card.id == cartaId) {
        mano.remove(card);
        c.write(card.jugada());
        break;
      }
    }
  }
  public void aplicar(CartaModificador card) {
    if (card.duracion == -1) {
      efectos.add(card);
    } else {
      temporal.add(card);
    }
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
  public String jugada() {
    return "jugada&"+id +"%" +descripcion +"%"+col +"\n";
  }
}
Jugador getJugadorbyIp(String ip) {
  for(int j = 0; j<jugadores.size();j++){
    print(jugadores.get(j).ip + "-----" +ip);
    if(jugadores.get(j).ip.equals(ip)){
    return jugadores.get(j);
    }
  }
  return null;
}