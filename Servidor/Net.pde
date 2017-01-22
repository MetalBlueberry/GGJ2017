void Net() {
  c = s.available();
  if (c != null) {
    try {
      println("Nuevo cliente");
      String input = c.readStringUntil('\n');
      println(input);
      String[] spliter = split(input, '&');
      println(spliter[0]);
      Jugador j = getJugadorbyIp(c.ip());
      if (j==null) {
        println("Jugador nuevo");
      }
      if (spliter[0].equals("unirse")) {
        print("comando unirse");
        if (j==null) {
          jugadores.add(new Jugador(c));
        }
      } else if (spliter[0].equals("jugar")) {
        if (j!=null) {
          j.jugarCarta(c,spliter[1]);
        }
      } else if (spliter[0].equals("descartar")) {
        if (j!=null) {
          j.descartarCarta(c,spliter[1]);
        }
      }
    }
    catch(Exception ex) {
    }
  }
}