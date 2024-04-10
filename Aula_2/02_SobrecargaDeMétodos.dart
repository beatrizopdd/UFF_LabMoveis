class Animal {
  void correr() {
    print("Correndo como animal.");
  }
}

class Gato extends Animal {
  @override
  void correr() {
    print("Correndo como gato!");
  }
}

void main() {
  Animal animalA = Animal();
  animalA.correr();

  // o Animal pode ser um Gato
  Animal animalG = Gato();
  animalG.correr();

  Gato gatoG = Gato();
  gatoG.correr();

  // o Gato não pode ser um Animal
  //Gato gatoA = Animal();
}