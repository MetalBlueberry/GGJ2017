import java.util.Collections;
import java.util.*;

class Stats
{
  int Tecnologia;
  int Moda;
  int Alimentacion;
  int Ocio;
  Stats(int Tecnologia, int Moda, int Alimentacion, int Ocio) {
    this.Tecnologia = Tecnologia;
    this.Moda = Moda;
    this.Alimentacion = Alimentacion;
    this.Ocio = Ocio;
  }
  Stats(int[] Tecnologia, int[] Moda, int[] Alimentacion, int[] Ocio) {
    this.Tecnologia = floor(random(Tecnologia[0], Tecnologia[1]+1));
    this.Moda = floor(random(Moda[0], Moda[1]+1));
    this.Alimentacion = floor(random(Alimentacion[0], Alimentacion[1]+1));
    this.Ocio = floor(random(Ocio[0], Ocio[1]+1));
  }

  public String toString() {
    return "T: " + Tecnologia + " M: " + Moda + " A: " + Alimentacion + " O: " + Ocio;
  }
}

class Producto
{
  Stats base;
}

class Persona {
  Stats vendido;
  Stats interesado;

  Persona(Stats interesado, Stats vendido) {
    this.interesado = interesado;
    this.vendido = vendido;
  }

  public String toString() {
    return "vendido    ("+vendido.toString()+")\ninteresado ("+interesado.toString()+")\n";
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
  }
  public void Add(T carta) {
    original.add(carta);
  }
  public  void Remove(T carta) {
    original.remove(carta);
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