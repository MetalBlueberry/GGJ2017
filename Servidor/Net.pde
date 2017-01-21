void Net() {
  c = s.available();
  if (c != null) {
    try{
    println("Nuevo cliente");
    String input = c.readStringUntil('\n');
    println(input);
    String[] spliter = split(input,'&');
        println(spliter[0]);
    if (spliter[0].equals("unirse")) {
      print("comando unirse");
      jugadores.add(new Jugador(c));     
    }

    }catch(Exception ex){}
  }
}