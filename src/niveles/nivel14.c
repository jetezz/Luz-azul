#include "nivel14.h"

void crearnivel14(){
    //player  portal puertas y marco
  createPlayer(2,2);
  createMarco(si);
  createPortal(si);
  createPuerta(1,2,sprite_Puerta_G,nivel_13);
  //createPuerta(7,3,sprite_Puerta_G,nivel_16);
  //createPuerta(9,3,sprite_Puerta_B,nivel_?);
  //createPuerta(15,2,sprite_Puerta_B,nivel_?);


  //rocas móviles (separando id por espacios)
  cambiarMov(mover_1);
 createRoca(4,3,sprite_Rock_G,2);
 createRocaEspejo(12,3,sprite_Rock_B,2);
 createRoca(4,6,sprite_Rock_G,3);
 createRocaEspejo(12,6,sprite_Rock_B,3);
 createRocaEspejo(13,4,sprite_Rock_B,4);



  cambiarMov(mover_Linea);
 createRoca(3,4,sprite_RockLineal1_G,4);
 createRocaEspejo(11,4,sprite_RockLineal1_B,5);


  cambiarMov(sin_Movimiento);
 createRoca(5,4,sprite_Rock_nomove_G,5);


   //decoracion muros
  crearMuro(1,1,7,2,sprite_Muro_Solid1,posicion_Izquieda);
  crearMuro(1,3,7,5,sprite_Muro_Solid1,posicion_Izquieda);
  crearMuro(9,2,15,1,sprite_Muro_Polvo1,posicion_Derecha);
  crearMuro(9,5,15,3,sprite_Muro_Polvo1,posicion_Derecha);
 
   //decoracion simetricos
  crearRocaYsimetrico(6,6,sprite_RockInmovil2_G,sprite_RockInmovil2_B,1);
  

  //decoracion izquierda
  createHoleIzquierda(5,3,sprite_hole,1);
  createHoleIzquierda(6,3,sprite_hole,1);
 
  //decoracionDerecha
  createHoleDerecha(10,2,sprite_hole,1);
}
