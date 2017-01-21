import g4p_controls.*;
import processing.net.*;
import java.util.*;


Client myClient; 
Boolean ocultar; 
Boolean mostrar;

List<Carta> Cartas = new ArrayList<Carta>();
Jugador jugador;
void setup() {
  
  size(450, 300);
  createGUI();
  
  frameRate(15);
  float xoff = width*0.05;
  float yoff = height*0.05;
  float w = width*0.9/5;
  float h = height*0.9/3;
  
  for(int j = 0; j < 10; j++){
    Cartas.add(new Carta(this,xoff+w*(j%5), yoff+h*floor(j/5), w, h, "0% "));
  }
  jugador = new Jugador(this,width*0.05,height*2/3,width*0.9,h);
  
}

void draw() {
  background(0);
  Net();
}

void Menu1ocultar(Boolean ocultar) {
  txtip.setVisible(ocultar); 
  txtpuerto.setVisible(ocultar);
  btnconectar.setVisible(ocultar);
  label1.setVisible(ocultar);
  label2.setVisible(ocultar);
}