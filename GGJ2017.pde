import processing.net.*;

MazoCartas<Persona> j1 = new MazoCartas<Persona>();  

void setup() {

  j1.Add(new Persona(new Stats(new int[] {0, 1}, new int[] {0, 1}, new int[] {0, 1}, new int[] {0, 1}), new Stats(new int[] {1, 3}, new int[] {1, 3}, new int[] {1, 3}, new int[] {1, 3}))); 
  j1.Add(new Persona(new Stats(new int[] {0, 1}, new int[] {0, 1}, new int[] {0, 1}, new int[] {0, 1}), new Stats(new int[] {1, 3}, new int[] {1, 3}, new int[] {1, 3}, new int[] {1, 3}))); 
  j1.Add(new Persona(new Stats(new int[] {0, 1}, new int[] {0, 1}, new int[] {0, 1}, new int[] {0, 1}), new Stats(new int[] {1, 3}, new int[] {1, 3}, new int[] {1, 3}, new int[] {1, 3}))); 
  j1.Add(new Persona(new Stats(new int[] {0, 1}, new int[] {0, 1}, new int[] {0, 1}, new int[] {0, 1}), new Stats(new int[] {1, 3}, new int[] {1, 3}, new int[] {1, 3}, new int[] {1, 3}))); 
  j1.Add(new Persona(new Stats(new int[] {0, 1}, new int[] {0, 1}, new int[] {0, 1}, new int[] {0, 1}), new Stats(new int[] {1, 3}, new int[] {1, 3}, new int[] {1, 3}, new int[] {1, 3}))); //5

  j1.Add(new Persona(new Stats(new int[] {1, 10}, new int[] {1, 10}, new int[] {1, 10}, new int[] {1, 10}), new Stats(new int[] {1, 10}, new int[] {1, 10}, new int[] {1, 10}, new int[] {1, 10}))); 
  j1.Add(new Persona(new Stats(new int[] {1, 10}, new int[] {1, 10}, new int[] {1, 10}, new int[] {1, 10}), new Stats(new int[] {1, 10}, new int[] {1, 10}, new int[] {1, 10}, new int[] {1, 10})));
  j1.Add(new Persona(new Stats(new int[] {1, 10}, new int[] {1, 10}, new int[] {1, 10}, new int[] {1, 10}), new Stats(new int[] {1, 10}, new int[] {1, 10}, new int[] {1, 10}, new int[] {1, 10})));
  j1.Add(new Persona(new Stats(new int[] {1, 10}, new int[] {1, 10}, new int[] {1, 10}, new int[] {1, 10}), new Stats(new int[] {1, 10}, new int[] {1, 10}, new int[] {1, 10}, new int[] {1, 10})));
  j1.Add(new Persona(new Stats(new int[] {1, 10}, new int[] {1, 10}, new int[] {1, 10}, new int[] {1, 10}), new Stats(new int[] {1, 10}, new int[] {1, 10}, new int[] {1, 10}, new int[] {1, 10})));//5

  j1.Add(new Persona(new Stats(new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}), new Stats(new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}))); 
  j1.Add(new Persona(new Stats(new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}), new Stats(new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}))); 
  j1.Add(new Persona(new Stats(new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}), new Stats(new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}))); 
  j1.Add(new Persona(new Stats(new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}), new Stats(new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}))); 
  j1.Add(new Persona(new Stats(new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}), new Stats(new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}))); 
  j1.Add(new Persona(new Stats(new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}), new Stats(new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}))); 
  j1.Add(new Persona(new Stats(new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}), new Stats(new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}))); 
  j1.Add(new Persona(new Stats(new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}), new Stats(new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}))); 
  j1.Add(new Persona(new Stats(new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}), new Stats(new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}))); 
  j1.Add(new Persona(new Stats(new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}), new Stats(new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}))); //10

  j1.Add(new Persona(new Stats(new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}), new Stats(new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}))); 
  j1.Add(new Persona(new Stats(new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}), new Stats(new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}))); 
  j1.Add(new Persona(new Stats(new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}), new Stats(new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}))); 
  j1.Add(new Persona(new Stats(new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}), new Stats(new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}))); 
  j1.Add(new Persona(new Stats(new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}), new Stats(new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}))); 
  j1.Add(new Persona(new Stats(new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}), new Stats(new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}))); 
  j1.Add(new Persona(new Stats(new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}), new Stats(new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}))); 
  j1.Add(new Persona(new Stats(new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}), new Stats(new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}))); 
  j1.Add(new Persona(new Stats(new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}), new Stats(new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}))); 
  j1.Add(new Persona(new Stats(new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}, new int[] {1, 5}), new Stats(new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}, new int[] {3, 8}))); //10

  j1.Add(new Persona(new Stats(new int[] {4, 8}, new int[] {4, 8}, new int[] {4, 8}, new int[] {4, 8}), new Stats(new int[] {6, 12}, new int[] {6, 12}, new int[] {6, 12}, new int[] {6, 12})));
  j1.Add(new Persona(new Stats(new int[] {4, 8}, new int[] {4, 8}, new int[] {4, 8}, new int[] {4, 8}), new Stats(new int[] {6, 12}, new int[] {6, 12}, new int[] {6, 12}, new int[] {6, 12})));
  j1.Add(new Persona(new Stats(new int[] {4, 8}, new int[] {4, 8}, new int[] {4, 8}, new int[] {4, 8}), new Stats(new int[] {6, 12}, new int[] {6, 12}, new int[] {6, 12}, new int[] {6, 12})));
  j1.Add(new Persona(new Stats(new int[] {4, 8}, new int[] {4, 8}, new int[] {4, 8}, new int[] {4, 8}), new Stats(new int[] {6, 12}, new int[] {6, 12}, new int[] {6, 12}, new int[] {6, 12})));
  j1.Add(new Persona(new Stats(new int[] {4, 8}, new int[] {4, 8}, new int[] {4, 8}, new int[] {4, 8}), new Stats(new int[] {6, 12}, new int[] {6, 12}, new int[] {6, 12}, new int[] {6, 12})));
  j1.Add(new Persona(new Stats(new int[] {4, 8}, new int[] {4, 8}, new int[] {4, 8}, new int[] {4, 8}), new Stats(new int[] {6, 12}, new int[] {6, 12}, new int[] {6, 12}, new int[] {6, 12})));
  j1.Add(new Persona(new Stats(new int[] {4, 8}, new int[] {4, 8}, new int[] {4, 8}, new int[] {4, 8}), new Stats(new int[] {6, 12}, new int[] {6, 12}, new int[] {6, 12}, new int[] {6, 12})));
  j1.Add(new Persona(new Stats(new int[] {4, 8}, new int[] {4, 8}, new int[] {4, 8}, new int[] {4, 8}), new Stats(new int[] {6, 12}, new int[] {6, 12}, new int[] {6, 12}, new int[] {6, 12})));
  j1.Add(new Persona(new Stats(new int[] {4, 8}, new int[] {4, 8}, new int[] {4, 8}, new int[] {4, 8}), new Stats(new int[] {6, 12}, new int[] {6, 12}, new int[] {6, 12}, new int[] {6, 12})));
  j1.Add(new Persona(new Stats(new int[] {4, 8}, new int[] {4, 8}, new int[] {4, 8}, new int[] {4, 8}), new Stats(new int[] {6, 12}, new int[] {6, 12}, new int[] {6, 12}, new int[] {6, 12})));
  j1.Add(new Persona(new Stats(new int[] {4, 8}, new int[] {4, 8}, new int[] {4, 8}, new int[] {4, 8}), new Stats(new int[] {6, 12}, new int[] {6, 12}, new int[] {6, 12}, new int[] {6, 12})));//10
  
  j1.Reiniciar();
  Persona p;
  do{
  p = j1.Robar();
  if(p !=null){
   print( p.toString());
  }
  }while(p!=null);
}


void draw() {
}