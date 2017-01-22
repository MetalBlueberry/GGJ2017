import java.util.Collections;
import java.util.*;

String[] Iniciales = {"J", "D", "H", "P"};
String[] NombreCompleto ={"Jugabilidad", "Diseño", "Historia", "Precio"};
class Stats
{
  int Alimentacion;
  int Moda;
  int Ocio;
  int Tecnologia;

  int Fabricacion = 0;

  Stats(int Alimentacion, int Moda, int Ocio, int Tecnologia) {
    this.Tecnologia = Tecnologia;
    this.Moda = Moda;
    this.Alimentacion = Alimentacion;
    this.Ocio = Ocio;
  }
  Stats(int[] Alimentacion, int[] Moda, int[] Ocio, int[] Tecnologia ) {
    this.Tecnologia = floor(random(Tecnologia[0], Tecnologia[1]+1));
    this.Moda = floor(random(Moda[0], Moda[1]+1));
    this.Alimentacion = floor(random(Alimentacion[0], Alimentacion[1]+1));
    this.Ocio = floor(random(Ocio[0], Ocio[1]+1));
  }
  public void set(int index, int valor) {
    switch(index) {
    case 0:
      Alimentacion = valor;
      break;
    case 1:
      Moda = valor;
      break;
    case 2:
      Ocio = valor;
      break;
    case 3:
      Tecnologia = valor;
      break;
    case 4:
      Fabricacion = valor;
      break;
    }
  }
  public int get(int index) {
    switch(index) {
    case 0:
      return Alimentacion;
    case 1:
      return Moda;
    case 2:
      return Ocio;
    case 3:
      return Tecnologia;
    case 4:
      return Fabricacion;
    }
    return 0;
  }
  public Stats add(Stats other) {
    // Stats s = new Stats(0, 0, 0, 0);
    for ( int j = 0; j < 5; j++) {
      set(j, get(j)+other.get(j));
    }
    return this;
  }
  public void copy(Stats other) {
    for ( int j = 0; j < 5; j++) {
      set(j, other.get(j));
    }
  }
  public String toString() {
    return "T: " + Tecnologia + " M: " + Moda + " A: " + Alimentacion + " O: " + Ocio;
  }
  public String send() {
    String temp = "atributos&";
    for ( int j = 0; j < 5; j++) {
      temp += j+"%"+get(j)+"%";
    }
    return temp;
  }
}

class Producto
{
  Stats base;
}
public void Carta_click(Carta imagebutton, GEvent event) {
  println(imagebutton.index);
  acciones.mostrar = imagebutton.index;
}


class Persona {
  Stats vendido;
  Stats interesado;

  public List<Integer> leInteresa = new ArrayList<Integer>();
  public int comprado = 0;

  Carta carta;
  int index;
  PApplet ventana;
  Persona(PApplet ventana, int x, int y, int w, int h, Stats interesado, Stats vendido) {
    this.interesado = interesado;
    this.vendido = vendido;

    index = AutoIndex_Persona;
    this.ventana = ventana;
    AutoIndex_Persona++;
  }
  Persona(PApplet ventana, Stats interesado, Stats vendido) {
    this(ventana, 0, 60, 144, 150, interesado, vendido);
  }
  public void display(float x, float y, float w, float h, int position) {
    if ( carta!=null) {
      carta.dispose();
    }
    /* String[] files = new String[] { 
     "ghost0.png", "ghost1.png", "ghost2.png"
     };*/
    int imagen = 1;//(int)random(10, 30);
    String[] files = new String[] { 
      imagen+"A.png", imagen+"A.png", imagen+"A.png"
    };

    carta = new Carta(ventana, this, x+w*(position%Columnas_Persona), y+h*floor((position/Columnas_Persona)), w, h, files, "", index);  
    carta.addEventHandler(ventana, "Carta_click");
  }

  public String toString() {
    return "vendido    ("+vendido.toString()+")\ninteresado ("+interesado.toString()+")\n";
  }

  public void Interesar(int index) {
    if (!leInteresa.contains(index)) {
      println("nuevo interesado");
      leInteresa.add(index);
    } else {
      println("eliminado interesado");
      leInteresa.remove(leInteresa.indexOf(index));
    }
  }
  public void Vender(int index) {
    if (comprado==0) {
      comprado = index;
    } else {
      comprado = 0;
    }
  }
}

class MazoCartas<T>
{
  List<T> original = new ArrayList<T>();
  List<T> mezclado = new ArrayList<T>();

  MazoCartas() {
  }
  MazoCartas(MazoCartas mazo) {
    original = new ArrayList<T>(mazo.original);
  }

  public void Reiniciar() {
    mezclado = new ArrayList<T>(original);
    Collections.shuffle(mezclado);

    //Codigo para dibujar
    float alturaCarta = 0.17; //height*(1-(alturaCarta*4))
    for (int j = 0; j < mezclado.size(); j++) {
      Persona p = null;
      try {
        p = (Persona)mezclado.get(j);
      }
      catch(Exception ex) {
      }
      if (p==null)return;
      p.display(0, height*0.1, width/Columnas_Persona, height*alturaCarta, j);
    }
  }
  public void Add(T carta) {
    original.add(carta);
  }
  public  void Remove(T carta) {
    original.remove(carta);
  }
  public T at(int index) {
    println(mezclado.size());
    println(original.size());
    return mezclado.get(index);
  }
  public T byid(int id) {
    for (int j = 0; j < mezclado.size(); j++) {
      if (((Persona)at(j)).index == id) {
        return (T)at(j);
      }
    }
    return null;
  }
  public int size() {
    return mezclado.size();
  }
  public void Vaciar() {
    original = new ArrayList<T>();
  }

  public T Robar() {
    if (mezclado.size()>0) {
      return mezclado.remove(0);
    } else {
      return null;
    }
  }
}

class Carta extends GImageButton {
  public int index;
  Persona parent;
  Carta(PApplet ventana, Persona parent, float x, float y, float w, float h, String[] images, String mask, int index) {
    super(ventana, x, y, w, h, images, mask);
    this.index = index;
    this.parent = parent;
  }
  public void draw() {
    super.draw();
    BarraInteresados(super.getHeight()*0.5) ;
    progressBar(super.getHeight()*0.6, parent.interesado.Alimentacion, parent.vendido.Alimentacion, 13, Iniciales[0]);
    progressBar(super.getHeight()*0.7, parent.interesado.Moda, parent.vendido.Moda, 13, Iniciales[1]);
    progressBar(super.getHeight()*0.8, parent.interesado.Ocio, parent.vendido.Ocio, 13, Iniciales[2]);
    progressBar(super.getHeight()*0.9, parent.interesado.Tecnologia, parent.vendido.Tecnologia, 13, Iniciales[3]);
    //seleccion de servidor
    if (acciones.mostrar == index) {
      noFill();
      stroke(255, 255, 255);
      strokeWeight(5); 
      rect(x, y, width, height); //Recuado de seleccion
    }
  }
  void progressBar( float y, int interesado, int vendido, int div, String inicial) {
    float grid = width*0.85/div;
    float xoff = super.getX() + super.getWidth()*0.15;
    float yoff = super.getY() ;
    strokeWeight(1);
    stroke(0);
    fill(255);
    rect(super.getX()+super.getWidth()*0.05, yoff+y, width*0.8, super.getHeight()*0.1);
    fill(0);
    textSize(super.getHeight()*0.1);
    text(inicial, super.getX()+super.getWidth()*0.05, yoff+y+super.getHeight()*0.1);
    for (int j = 0; j<div; j++) {
      if (j<interesado && j<vendido) {
        fill(255, 0, 0);
      } else if (j<vendido) {
        fill(255, 255, 0);
      } else {
        fill(0, 255, 0);
      }
      rect(xoff+j*grid, y+yoff, grid, super.getHeight()*0.1);
    }
    for (int j = 0; j<div; j++) {
      if (j==interesado-1 && interesado < vendido) {
        fill(255, 255, 0);
        text(interesado, xoff+j*grid, y+yoff+super.getHeight()*0.1);
      } else
        if (j==vendido-1) {
          fill(0);
          text(vendido, xoff+j*grid, y+yoff+super.getHeight()*0.1);
        }
    }
  }
  void BarraInteresados(float y) {
    try {
      float xoff = super.getX() + super.getWidth()*0.05;
      float yoff = super.getY() ;
      float divs = super.getWidth()*0.9 / jugadores.size();
      strokeWeight(1);
      stroke(0);
      for (int j = 0; j<jugadores.size(); j++) {
        if (parent.leInteresa.contains(j)) {
          //fill(0, 255, 0);
          fill(coloresJugadores[j]);
        } else {
          fill(255, 255, 255);
        }
        rect(xoff+j*divs, y+yoff, divs, super.getHeight()*0.1);
      }
    }
    catch (Exception ex) {
    }
  }
}

public void Economia_click(GButton button, GEvent event) {
  //println(button.getText());
  if (button.getText() == "Avanzar") {
    economia.Avanzar();
  } else if (button.getText() == "Reset") {
    economia.Reset();
  }
}
class EconomiaGlobal extends GImageButton {
  Stats valor;
  public class Accion {
    int valor;
    int atributo;
    Accion(int valor, int atributo) {
      this.valor = valor;
      this. atributo= atributo;
    }
    public void hacer(EconomiaGlobal eco) {
      switch(atributo) {
      case 0:
        eco.valor.Alimentacion += valor;
        break;
      case 1:
        eco.valor.Moda += valor;
        break;
      case 2:
        eco.valor.Ocio += valor;
        break;
      case 3:
        eco.valor.Tecnologia += valor;
        break;
      }
    }
  }
  MazoCartas<Accion> Acciones = new MazoCartas<Accion>();

  GButton Avanzar;
  public void Avanzar() {
    println("Robar");
    Accion a = Acciones.Robar();
    println("Robado");
    a.hacer(this);
    println("Hecho");
  }
  GButton Reset;
  public void Reset() {
    print("RESET");
    Acciones.Reiniciar();
    valor = new Stats(0, 0, 0, 0);
  }

  EconomiaGlobal(PApplet ventana, float x, float y, float w, float h) {
    super(ventana, x, y, w, h, null);
    setVisible(false);
    //valor
    valor = new Stats(0, 0, 0, 0);
    mazoAcciones1(this, Acciones);
    //botones
    Reset = new GButton(ventana, x+w*0.1, y+h*0.8, w *0.4, h*0.2);
    Reset.setText("Reset");
    Reset.addEventHandler(ventana, "Economia_click");
    Avanzar = new GButton(ventana, x+w*0.6, y+h*0.8, w *0.4, h*0.2);
    Avanzar.setText("Avanzar");
    Avanzar.addEventHandler(ventana, "Economia_click");
  }

  public void draw() {
    progressBar(super.getHeight()*0.0, valor.Alimentacion, 20, 0.2, Iniciales[0] );
    progressBar(super.getHeight()*0.2, valor.Moda, 20, 0.2, Iniciales[1] );
    progressBar(super.getHeight()*0.4, valor.Ocio, 20, 0.2, Iniciales[2] );
    progressBar(super.getHeight()*0.6, valor.Tecnologia, 20, 0.2, Iniciales[3] );
  }
  void progressBar(float y, int valor, int div, float h, String inicial) {
    valor = valor +10;
    float grid = super.getWidth()*0.85/div;
    float xoff = super.getX() + super.getWidth()*0.15;
    float yoff = super.getY() ;
    strokeWeight(1);
    stroke(0);
    fill(255);
    rect(super.getX()+super.getWidth()*0.05, yoff+y, width*0.8, super.getHeight()*h);
    fill(0);
    textSize(super.getHeight()*h);
    text(inicial, super.getX()+super.getWidth()*0.05, yoff+y+super.getHeight()*h);
    for (int j = 0; j<div; j++) {
      if (j<valor) {
        fill(255, 0, 0);
      } else {
        fill(0, 255, 0);
      }
      rect(xoff+j*grid, y+yoff, grid, super.getHeight()*h);
    }
    for (int j = 0; j<div; j++) {
      if (j==valor-1) {
        fill(0);
        text(valor -10, xoff+j*grid, y+yoff+super.getHeight()*h);
      }
    }
  }
}


public void Acciones_Click(GButton button, GEvent event) {
  println(button.getText());

  int id = Integer.valueOf(button.getText().split(" ")[1]);
  println(id);
  println("mostraro: "+acciones.mostrar);
  Persona p = personas.byid(acciones.mostrar);
  println("Persona: "+ p.index);
  println("persona");
  if (button.getText().startsWith("interesar")) {
    println("interesar");
    p.Interesar(id);
    println("itneresdo");
  } else if (button.getText().startsWith("vender")) {
    p.Vender(id);
  }
}
class AccionesSobrePersonas extends GImageButton {
  public int mostrar = 0;
  List<GButton> interesado = new ArrayList<GButton>();
  List<GButton> vendido = new ArrayList<GButton>();


  AccionesSobrePersonas(PApplet ventana, float x, float y, float w, float h) {
    super(ventana, x, y, w, h, null);
    setVisible(false);
  }

  public void GenerarControles(PApplet ventana) {
    while (interesado.size() > 0 ) {
      GButton p = interesado.remove(0);
      if (p !=null) {
        p.dispose();
      }
    }
    while (vendido.size() > 0 ) {
      GButton p = vendido.remove(0);
      if (p !=null) {
        p.dispose();
      }
    }
    for (int j = 0; j<jugadores.size(); j++) {
      GButton box = new GButton(ventana, x+(j*width/jugadores.size()), y + height*3/4, width/jugadores.size()/2, height/4);
      box.setText("interesar " +j);
      box.addEventHandler(ventana, "Acciones_Click");
      interesado.add(box);
      box = new GButton(ventana, x+(j*width/jugadores.size()+width/jugadores.size()/2), y + height*3/4, width/jugadores.size()/2, height*1/4);
      box.setText("vender " +j);
      vendido.add(box);
    }
  }
  public void draw() {
    //if (isVisible()) {
    for (int j = 0; j<jugadores.size(); j++) {
      float posx = j*width/jugadores.size();
      float posy = 0;
      float dimWidth = width/jugadores.size();
      float dimHeight = height*3/4;
      fill(coloresJugadores[j]);
      rect(x+posx, y+posy, dimWidth, dimHeight);
    }
    // }
  }
}