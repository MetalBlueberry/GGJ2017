void Net() {
  if (myClient != null && myClient.available()>0) {
   // try {
      println("Nuevo mensaje");
      String input=myClient.readStringUntil('\n');
      println(input);  
      String[] Spliter=split(input, '&');
      println("Spliter0: "+Spliter[0]);  
      println("Spliter1: "+Spliter[1]); 
     
      if (Spliter[0].equals("jugador")) {
       jugador.setId(Integer.valueOf(Spliter[1].trim()));
        ocultar=false;
        Menu1ocultar(ocultar);
        mostrar=true;
     
      } else if (Spliter[0].equals("carta")) {
      }
    //}
    //catch(Exception ex) {    }
  }
}