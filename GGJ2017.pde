import g4p_controls.*;

import processing.net.*;

MazoCartas<Persona> personas = new MazoCartas<Persona>();  
EconomiaGlobal economia;
AccionesSobrePersonas acciones ;

List<Jugador> jugadores = new ArrayList<Jugador>();


Server s;

//cuadricula
int AutoIndex_Persona = 0; // se incrementa cada vez que se crea una persona
int Columnas_Persona = 10;

//jugadores
int AutoIndex_Jugadores = 1; // se incrementa cada vez que se crea una persona
void setup() {

  createGUI();

  mazo1(personas);

  personas.Reiniciar();
  Persona p;
  int iterator = 0;
  do {
    p = personas.at(iterator);
    if (p !=null) {
      print(p.toString());
      float alturaCarta = 0.18; //height*(1-(alturaCarta*4))
      p.display(0, 0, width/Columnas_Persona, height*alturaCarta, iterator);
      iterator++;
    }
  } while (iterator<personas.size());
  try {
    s = new Server(this, 2017); // Start a simple server on a port
  }
  catch (Exception e) {
    print("error al usar este puerto");
  }
  size(1440, 900);
  frameRate(15);
  //fullScreen();
  surface.setLocation(0, 0);

  ip.setText(Server.ip());


  economia = new EconomiaGlobal(this, width*0.2, height*0.91, width*0.2, height*0.09);
  acciones = new AccionesSobrePersonas(this, width*0.5, height*0.91, width*0.5, height*0.09);
  jugadores.add(new Jugador());
  jugadores.add(new Jugador());
  jugadores.add(new Jugador());
  jugadores.add(new Jugador());
  acciones.GenerarControles(this);
  background(0);
}


void draw() {
  background(0);
}