import g4p_controls.*;
import processing.net.*;
import java.util.*;


Client myClient; 
Boolean visible; 
Boolean mostrar;

List<Carta> Cartas = new ArrayList<Carta>();
Jugador jugador;
void setup() {

  size(750, 500);
  createGUI();

  frameRate(15);
  float xoff = width*0.05;
  float yoff = height*0.05;
  float w = width*0.9/5;
  float h = height*0.9/3;
  String[] files = new String[] { 
    "borde0.png", "borde1.png", "borde2.png"
  };
  for (int j = 0; j < 10; j++) {
    Cartas.add(new Carta(this, xoff+w*(j%5), yoff+h*floor(j/5), w, h, "0% ",files));
  }
  jugador = new Jugador(this, width*0.05, height*2/3, width*0.9, h);
}

void draw() {
  background(0);
  Net();
  if (myClient!=null &&myClient.active()) {
    Menu2(true);
    Menu1(false);
  } else {
    Menu2(false);
    Menu1(true);
  }
}

void Menu1(Boolean visible) {
  txtip.setVisible(visible); 
  txtpuerto.setVisible(visible);
  btnconectar.setVisible(visible);
  label1.setVisible(visible);
  label2.setVisible(visible);
}
void Menu2(Boolean visible) {
  for (int j = 0; j < Cartas.size(); j++) {
    Cartas.get(j).setVisible(visible);

  }
  jugador.setVisible(visible);
}