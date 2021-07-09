#include "nivel17.h"

void crearnivel17(){
 //player  portal puertas y marco
  createPlayer(2,4);
  createMarco(no);
  createPortal(si);
  createPuerta(1,2,sprite_Puerta_B,nivel_16);
  createPuerta(1,6,sprite_Puerta_B,nivel_16);
  createPuerta(15,4,sprite_Puerta_B,nivel_18);
  

  //rocas móviles (separando id por espacios)
  cambiarMov(mover_1);
 createRoca(3,3,sprite_Rock_B,2);
 createRocaEspejo(13,3,sprite_Rock_B,2);
 createRoca(3,5,sprite_Rock_B,3);
 createRocaEspejo(13,5,sprite_Rock_B,3);
 createRoca(5,3,sprite_Rock_B,4);
 createRocaEspejo(11,3,sprite_Rock_B,4);
 createRoca(5,5,sprite_Rock_B,5);
 createRocaEspejo(11,5,sprite_Rock_B,5);

  cambiarMov(mover_Linea);
  cambiarMov(sin_Movimiento);


   //decoracion muros
  crearMuro(1,1,7,1,sprite_Muro_Polvo1,posicion_Izquieda);
  crearMuro(1,7,7,7,sprite_Muro_Polvo1,posicion_Izquieda);
  crearMuro(9,1,15,1,sprite_Muro_Polvo1,posicion_Derecha);
  crearMuro(9,7,14,7,sprite_Muro_Polvo1,posicion_Derecha);
  crearMuro(15,1,15,7,sprite_Muro_Polvo1,posicion_Derecha);
 
   //decoracion simetricos
  crearRocaYsimetrico(1,3,sprite_Muro_Polvo1,sprite_Muro_Polvo1,1);
  crearRocaYsimetrico(1,5,sprite_Muro_Polvo1,sprite_Muro_Polvo1,1);
  crearRocaYsimetrico(7,2,sprite_Muro_Polvo1,sprite_Muro_Polvo1,1);
  crearRocaYsimetrico(7,3,sprite_Muro_Polvo1,sprite_Muro_Polvo1,1);
  crearRocaYsimetrico(7,5,sprite_Muro_Polvo1,sprite_Muro_Polvo1,1);
  crearRocaYsimetrico(7,6,sprite_Muro_Polvo1,sprite_Muro_Polvo1,1);
  

  //decoracion izquierda
  createRoca(1,4,sprite_Muro_Polvo1,1);
  createRoca(8,3,sprite_RockInmovil1_B,1);
  createRoca(8,5,sprite_RockInmovil1_B,1);
 
  //decoracionDerecha
 createRocaEspejo(15,2,sprite_Muro_Polvo1,1);
 createRocaEspejo(15,6,sprite_Muro_Polvo1,1);



}
