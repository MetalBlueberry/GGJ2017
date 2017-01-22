import g4p_controls.*;

import processing.net.*;

MazoCartas<Persona> personas = new MazoCartas<Persona>();  
EconomiaGlobal economia;
AccionesSobrePersonas acciones ;

List<Jugador> jugadores = new ArrayList<Jugador>();

Server s;
Client c;

//cuadricula
int AutoIndex_Persona = 0; // se incrementa cada vez que se crea una persona
int Columnas_Persona = 10;

//jugadores
int AutoIndex_Jugadores = 1; // se incrementa cada vez que se crea una persona
int AutoIndex_CartaJugador = 0; // se incrementa cada vez que se crea una carta de jugador
void setup() {

  createGUI();

  mazo1(personas);

  try {
    s = new Server(this, 12345); // Start a simple server on a port
  }
  catch (Exception e) {
    print("error al usar este puerto");
  }
  // size(1440,900);
  size(1080, 675);
  //fullScreen();
  frameRate(15);
  surface.setLocation(0, 0);

  ip.setText(Server.ip());

  economia = new EconomiaGlobal(this, width*0.2, height*0, width*0.2, height*0.09);
  acciones = new AccionesSobrePersonas(this, width*0.5, height*0, width*0.5, height*0.09);
  
  mazoJugador1(mazoJugadores);

  background(0);
}


void draw() {
  background(0);
  
  Net();
}