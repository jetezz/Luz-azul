#include "nivel09.h"

void crearnivel09(){
     //player  portal puertas y marco
  createPlayer(2,4);
  createMarco(si);
  createPortal(si);
  createPuerta(1,4,sprite_Puerta_G,nivel_08);
  createPuerta(5,2,sprite_Puerta_G,nivel_10);
  createPuerta(5,6,sprite_Puerta_G,nivel_11);
  createPuerta(11,2,sprite_Puerta_B,nivel_09_01);
  createPuerta(11,6,sprite_Puerta_B,nivel_09_02);
  createPuerta(15,4,sprite_Puerta_B,nivel_trap_03);

  //rocas móviles (separando id por espacios)
  cambiarMov(mover_1);
  createRoca(2,5,sprite_Rock_G,3);
  createRoca(3,3,sprite_Rock_G,4);
  createRoca(5,5,sprite_Rock_G,5);
  createRocaEspejo(10,3,sprite_Rock_B,6);
  createRocaEspejo(12,5,sprite_Rock_B,7);


  cambiarMov(mover_Linea);
  createRocaEspejo(11,4,sprite_RockLineal1_B,8);


  cambiarMov(sin_Movimiento);
  createRoca(4,2,sprite_Rock_nomove_G,2);
  createRoca(5,3,sprite_Rock_nomove_G,2);
  createRoca(4,5,sprite_Rock_nomove_G,2);
  createRocaEspejo(13,3,sprite_Rock_nomove_B,4);
  createRocaEspejo(14,5,sprite_Rock_nomove_B,3);


   //decoracion muros
  crearMuro(1,1,7,1,sprite_Muro_Solid1,posicion_Izquieda);
  crearMuro(1,7,7,7,sprite_Muro_Solid1,posicion_Izquieda);
  crearMuro(9,1,15,1,sprite_Muro_Solid1,posicion_Derecha);
  crearMuro(9,7,15,7,sprite_Muro_Solid1,posicion_Derecha);
 
   //decoracion simetricos
  crearRocaYsimetrico(6,6,sprite_RockInmovil1_G,sprite_RockInmovil1_B,1);
  

  //decoracion izquierda
  createRoca(4,6,sprite_RockInmovil1_G,1);    
  createHoleIzquierda(6,3,sprite_hole,1);
  createHoleIzquierda(6,5,sprite_hole,1);


  //decoracionDerecha
  createHoleDerecha(10,5,sprite_hole,1);
  createHoleDerecha(11,3,sprite_hole,1);
  createHoleDerecha(11,5,sprite_hole,1);
  createHoleDerecha(12,2,sprite_hole,1);
  createHoleDerecha(12,6,sprite_hole,1);


}
