void Net() {
  if (myClient != null && myClient.available()>0) {
    try {
      println("Nuevo mensaje");
      String input=myClient.readStringUntil('\n');
      println(input);  
      String[] Spliter=split(input, '&');
     // println("Spliter0: "+Spliter[0]);  
     // println("Spliter1: "+Spliter[1]); 

      if (Spliter[0].equals("jugador")) {
        jugador.setId(Integer.valueOf(Spliter[1].trim()));
        jugador.setColor(Integer.valueOf(Spliter[2].trim()));
      } else if (Spliter[0].equals("carta")) {
         println("Nuevo carta");
        for ( int j = 0; j < Cartas.size(); j++) {
          Carta carta = Cartas.get(j);
          if (carta.id == -1) {
            carta.setDatos(Spliter[1]);
            break;
          }
        }
      }
    }
    catch(Exception ex) {
    }
  }
}
void net_jugarCarta(int n){
  myClient.write("jugar&"+n+"\n");
}
void net_descartarCarta(int n){
  myClient.write("descartar&"+n+"\n");
}