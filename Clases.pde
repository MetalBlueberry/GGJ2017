class Interes
{
  int Tecnologia;
  int Moda;
  int Alimentacion;
  int Ocio;
  Interes(int Tecnologia, int Moda, int Alimentacion, int Ocio) {
    this.Tecnologia = Tecnologia;
    this.Moda = Moda;
    this.Alimentacion = Alimentacion;
    this.Ocio = Ocio;
  }
}

class Producto
{
  Interes base;
}

class Persona {
  Interes vendido;
  Interes interesado;

  Persona() {
    
  }
}